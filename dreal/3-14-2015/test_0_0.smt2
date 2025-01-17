(set-logic QF_NRA_ODE)
(declare-fun v () Real)
(declare-fun tau () Real)
(declare-fun sy () Real)
(declare-fun sx () Real)
(declare-fun delta () Real)
(declare-fun Psi_dot () Real)
(declare-fun Psi () Real)
(declare-fun Beta () Real)
(declare-fun v_0_0 () Real)
(declare-fun v_0_t () Real)
(declare-fun tau_0_0 () Real)
(declare-fun tau_0_t () Real)
(declare-fun sy_0_0 () Real)
(declare-fun sy_0_t () Real)
(declare-fun sx_0_0 () Real)
(declare-fun sx_0_t () Real)
(declare-fun delta_0_0 () Real)
(declare-fun delta_0_t () Real)
(declare-fun Psi_dot_0_0 () Real)
(declare-fun Psi_dot_0_t () Real)
(declare-fun Psi_0_0 () Real)
(declare-fun Psi_0_t () Real)
(declare-fun Beta_0_0 () Real)
(declare-fun Beta_0_t () Real)
(declare-fun time_0 () Real)
(declare-fun mode_0 () Real)
(define-ode flow_1 ((= d/dt[Beta] (- (+ (* (- (/ (- (* 108000 1.515) (* 108000 1.292)) (* (* 2273 v) v)) 1) Psi_dot) (/ (* 108000 delta) (* 2273 v))) (* (* (/ (- 108000 108000) 2273) v) Beta))) (= d/dt[Psi_dot] (+ (- (* (/ (- (* 108000 1.515) (* 108000 1.292)) 4423) Beta) (* (/ (- (* (* 108000 1.292) 1.292) (* (* 108000 1.515) 1.515)) 4423) (/ Psi_dot v))) (* (/ (* 108000 1.292) 4423) delta))) (= d/dt[Psi] Psi_dot) (= d/dt[v] (* 1 (+ (* (cos (arccos (/ 1 (* v (cos v))))) (- v sx)) (* (sin (arccos (/ 1 (* v (cos v))))) (- (sin v) sy))))) (= d/dt[sx] (* v (cos (+ Beta Psi)))) (= d/dt[sy] (* v (sin (+ Beta Psi)))) (= d/dt[delta] (- (+ (+ (* 2 (- (* (cos (arccos (/ 1 (* v (cos v))))) (- (sin v) sy)) (* (sin (arccos (/ 1 (* v (cos v))))) (- v sx)))) (* 12 (- (arccos (/ 1 (* v (cos v)))) Psi))) (* 4 (- (/ (* v (sin v)) (^ (- (^ v 2) (^ (cos v) 2)) 0.5)) Psi_dot))) (* 2 delta))) (= d/dt[tau] 1)))
(assert (<= 1.9 v_0_0))
(assert (<= v_0_0 4))
(assert (<= 1.9 v_0_t))
(assert (<= v_0_t 4))
(assert (<= 0 tau_0_0))
(assert (<= tau_0_0 10))
(assert (<= 0 tau_0_t))
(assert (<= tau_0_t 10))
(assert (<= 0 sy_0_0))
(assert (<= sy_0_0 10))
(assert (<= 0 sy_0_t))
(assert (<= sy_0_t 10))
(assert (<= 0 sx_0_0))
(assert (<= sx_0_0 10))
(assert (<= 0 sx_0_t))
(assert (<= sx_0_t 10))
(assert (<= -0.15 delta_0_0))
(assert (<= delta_0_0 0.15))
(assert (<= -0.15 delta_0_t))
(assert (<= delta_0_t 0.15))
(assert (<= -1 Psi_dot_0_0))
(assert (<= Psi_dot_0_0 1))
(assert (<= -1 Psi_dot_0_t))
(assert (<= Psi_dot_0_t 1))
(assert (<= -1 Psi_0_0))
(assert (<= Psi_0_0 3))
(assert (<= -1 Psi_0_t))
(assert (<= Psi_0_t 3))
(assert (<= -1 Beta_0_0))
(assert (<= Beta_0_0 1))
(assert (<= -1 Beta_0_t))
(assert (<= Beta_0_t 1))
(assert (<= 0 time_0 [0.000000]))
(assert (<= time_0 10 [0.000000]))
(assert (<= 1 mode_0))
(assert (<= mode_0 1))
(assert (and (and (= v_0_0 2) (= sy_0_0 0) (= sx_0_0 0) (= tau_0_0 0)) (= mode_0 1) (= [v_0_t tau_0_t sy_0_t sx_0_t delta_0_t Psi_dot_0_t Psi_0_t Beta_0_t] (integral 0. time_0 [v_0_0 tau_0_0 sy_0_0 sx_0_0 delta_0_0 Psi_dot_0_0 Psi_0_0 Beta_0_0] flow_1)) (= mode_0 1) (forall_t 1 [0 time_0] (>= sx_0_t 0)) (>= sx_0_t 0) (>= sx_0_0 0) (forall_t 1 [0 time_0] (>= v_0_t 0)) (>= v_0_t 0) (>= v_0_0 0) (= mode_0 1) (> sx_0_t 0.45) (> tau_0_t 5)))
(check-sat)
(exit)
