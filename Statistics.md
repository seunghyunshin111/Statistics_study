## ROC 곡선

- x축의 특이도에 대한 y축의 재현율(민감도)을 표시

- 1을 잘 잡아낸다는 것은 그만큼 0을 1로 잘못 예측할 가능성도 높아지는 것을 의미

- 이상적인 분류기란, 0을 1로 잘못 분류하지 않으면서 동시에 1을 정말 잘 분류하는 분류기

  <br>

  ## 리프트

  - 분류기 성능을 평가하는 지표
  - 모델이 1을 얼마나 효과적으로 분류해내는지를 측정, 가장 1로 분류될 가능성이 높은 것부터 매 십분위마다 이를 계산

  <br>

  ## lift curve

  - 랜덤 선택을 의미하는 대각선에 대한 누적이득의 비율

  

<br>

## 데이터 생성

- 기존에 존재하는 데이터를 살짝 바꿔 새로운 레코드를 만듦

  ## SMOTE

  - 업샘플링된 레코드와 비슷한 레코드를 찾고, 원래 레코드와 이웃 레코드의 랜덤 가중평균으로 새로운 합성 레코드를 만듦.
  - 여기에 각각의 예측변수에 대해 개별적으로 가중치 생성
  - 새로 합성된 업샘플 레코드의 개수는 데이터의 균형을 맞추기 위해 필요한 업샘플링 비율에 따라 달라짐

<br>

## 분류

- 어떤 레코드가 두 가지(또는 소수) 범주 중 어디에 속하는지를 예측하는 프로세스, 예측 분석을 위한 기본 도구
- 프로세스의 핵심은 관심 있는 클래스에 속할 확률인 '경향 점수'를 추정하는 것

<br>

## 편향-분산 트레이드오프

- 과잉 평탄화(오버스무딩)과 과잉 적합화(오버피팅) 사이의 이율배반 관계
- 통계적 모델 적합화(피팅)에 늘 존재하는 문제
- 분산은 학습 데이터 선정에 따라 발생하는 모델리 오차, 즉 다른 학습 데이터 집합을 사용할 경우, 결과적으로 나오는 모델이 달라지는 정도
- 편향은 모델이 실제 세계를 정확히 표현하지 못하기 때문에 발생하는 모델링 오차, 데이터 추가로 나아지지 않는다. 유연한 모델에서 오버피팅이 발생했다면, 분산이 증가한 것을 의미
- 트레이드오프를 다루기 위해 **교차타당성검사**를 사용

<bR>

## 배깅

- 데이터를 부트스트래핑해서 여러 모델을 만드는 일반적인 방법

<br>

## 앙상블

- 여러 모델의 집합을 이용해서 하나의 예측을 이끌어내는 방식
- 배깅, 부스팅

<br>

## 랜덤 포레스트

- 의사 결정 트리 모델에 기반을 둔 배깅 추정 모델 (배깅 의사 트리)
- 의사 결정 트리 모델에, **변수 샘플링** 을 포함한 것
- 알고리즘의 각 단계마다, 고를 수 있는 변수가 **랜덤하게 결정된 전체 변수들의 부분집합** 에 한정
- 배깅 + 각 분할을 위한 변수의 부트스트랩 샘플링이 추가되는 것
- 매 단계마다 예측 변수를 랜덤하게 선택하기 된다. 기본적으로 500개의 트리를 학습을 통해 생성
- OOB 에러 out of bag 추정 에러, 학습 데이터에 속하지 않는 데이터를 사용해 구한 학습된 모델의 오차율
- 단순 단일 트리보다 훨씬 정확한 예측 성능을 보임
- 직관적인 해석은 불가능
- 랜덤 포레스트에 의한 오버피팅 위험성 있음

<br>

## 변수 중요도

- 모델 성능에 미치는 예측변수의 중요도

  1. 변수 값을 랜덤하게 섞었다면, **모델의 정확도가 감소**하는 정도를 측정.

     변수를 랜덤하게 섞는다는 것은 해당 변수가 예측에 미치는 모든 영향력을 제거하는 것을 의미

     정확도는 OBB 데이터로부터 얻는다(결국 교차타당성검사와 같은 효과를 갖는다.)

  2. 특정 변수를 기준으로 분할이 일어난 모든 노드에서 대한 **불순도 점수의 평균 감소량**을 측정한다.

     이 지표는 해당 변수가 노드의 순도를 개선하는 데 얼마나 기여했는지를 나타낸다.

     물론 이 지표는 학습 데이터를 기반으로 측정되기 때문에, OOB 데이터를 가지고 계산한 것에 비해 믿을 만하지 않다.

<br>

즉, 각각 정확도, 지니 불순도가 감소하는 정도를 통해 '변수 중요도'를 보여준다.

정확도 감소량을 기준으로 변수들의 순위를 결정.

<br>

## 랜덤 포레스트 기반 변수 중요도

- 피처와 레코드의 개수가 많은 데이터에 대해 예측 모델을 만들 때 장점
- 다수의 예측변수 중 어떤 것이 중요한지, 이들 사이에 존재하는 상관관계 항들에 대응되는 복잡한 관계들을 자동으로 결정
- **지니 불순도** 만 활용
- 성능을 조절할 수 있는 손잡이가 달린 일종의 블랙박스 알고리즘
- 손잡이: 하이퍼파라미터
- 파라미터들은 모델 학습 전에 미리 정해야 한다.
- 랜덤 포레스트에서 하이퍼파라미터는 오버피팅을 피하기 위해 매우 중요
- 랜덤 포레스트에서는 오버피팅을 피하기 위해 교차타당성검사를 통해 조정된 하이퍼파라미터를 사용한다.


