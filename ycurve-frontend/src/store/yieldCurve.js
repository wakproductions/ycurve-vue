import fetchApi from '@/util/fetchApi'
import buildDataStruct from '@/util/buildDataStruct'

export const types = {
  GET_INITIAL_YCURVE_REQUEST: 'GET_INITIAL_YCURVE_REQUEST',
  GET_YCURVE_REQUEST: 'GET_YCURVE_REQUEST',
  PIN_YCURVE: 'PIN_YCURVE',
  SET_CURRENT_YCURVE: 'SET_CURRENT_YCURVE',
  SET_FETCH_STATE_PENDING: 'SET_FETCH_STATE_PENDING',
  SET_FETCH_STATE_READY: 'SET_FETCH_STATE_READY'
};

export const fetch_states = {
  PENDING: 'PENDING',
  READY: 'READY'
}

export default {
  state: {
    fetch_state: fetch_states.READY,
    datasets: [
      {
        borderColor: "#6600FF",
        data: [1.28, 1.39, 1.53, null, 1.76, 1.89, 1.98, 2.2],
        fill: false,
        label: "12/30/2017"
      },
      {
        borderColor: "#4abaff",
        data: [0.25, 0.19, 0.87, 1.02, 1.11, null, null, 1.89, 1.57, 3.4],
        fill: false,
        label: "5/11/1993"
      },
    ],
  },
  mutations: {
    [types.SET_FETCH_STATE_PENDING]: (state) => {
      state.fetch_state = fetch_states.PENDING;
    },
    [types.GET_YCURVE_REQUEST]: (state) => {
      state.datasets = [
        {
          borderColor: "#6600FF",
          data: [1.0, 1.00, 1.0, 1.2, 1.2, 1.3, 1.4, 1.4],
          fill: false,
          label: "12/30/2017"
        },
        {
          borderColor: "#4abaff",
          data: [2.1, 2.2, 2.3, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4],
          fill: false,
          label: "5/11/1993"
        },

        // [
        // {
        //   borderColor: "#6600FF",
        //   data: [1.28, 1.39, 1.53, null, 1.76, 1.89, 1.98, 2.2],
        //   fill: false,
        //   label: "12/30/2017"
        // }
        // ]

      ];
    },
    [types.GET_INITIAL_YCURVE_REQUEST]: (state) => {
      // state.datasets = [
        // {
        //   borderColor: "#6600FF",
        //   data: [1.0, 1.00, 1.0, 1.2, 1.2, 1.3, 1.4, 1.4],
        //   fill: false,
        //   label: "12/30/2017"
        // },
        // {
        //   borderColor: "#4abaff",
        //   data: [2.1, 2.2, 2.3, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4, 2.4],
        //   fill: false,
        //   label: "5/11/1993"
        // }
      // ]


      // code below will eventually be moved into types.FETCH_YCURVE_REQUEST, date = todaysDate

      var todaysDate = new Date();
      fetchApi(todaysDate).then((response) => {
        var newData = response.data
        console.log(newData)
        
        // console.log(buildDataStruct(newData, '8/1/2018'))
        state.datasets = [
          buildDataStruct(newData, todaysDate),
          // {
          //   borderColor: "#FF0055",
          //   data: [1.4,1.4,1.4,1.4,1.4,1.2,1.1,0.8],
          //   fill: false,
          //   label: 'Secondary'
          // }
        ]
      });
      // newData = [1.28, 1.39, 1.53, null, 1.76, 1.89, 1.98, 2.2];
      },
    [types.SET_CURRENT_YCURVE]: (state, dataset) => {
      state.datasets = [
        dataset
      ]
    }

      //   [types.UPDATE_CERT_SUCCESS]: (state, payload) => {
  //     state.loading = false;
  //     const index = state.list.findIndex(cert => cert.id === payload.id);
  //     state.list[index].certified = payload.certified;
  //   },
  //   [types.UPDATE_CERTS_ORDER]: (state, payload) => {
  //     state.list = payload;
  //   },
  },
  actions: {
    [types.GET_YCURVE_REQUEST]: ({commit}) => {
      commit(types.GET_YCURVE_REQUEST);
    },
    [types.GET_INITIAL_YCURVE_REQUEST]: ({commit}) => {
      commit(types.GET_INITIAL_YCURVE_REQUEST);
    }

  //   [types.UPDATE_CERT_REQUEST]: ({ commit }, { id, certified }) => {
  //     commit(types.UPDATE_CERT_REQUEST);
  //
  //     return apiFetch(
  //       `/api/certifications/${id}/certify`,
  //       certified ? 'post' : 'delete'
  //     ).then(() => {
  //       commit(types.UPDATE_CERT_SUCCESS, { id, certified });
  //     });
  //   },
  },
  getters: {
    // allCerts: state => {
    //   return state.list;
    // },
    // certNames: state => {
    //   return state.list.map(cert => cert.name);
    // },
    // certIssuers: state => {
    //   return removeDuplicates(state.list, 'issuer').map(cert => cert.issuer);
    // },
  },
  methods: {
    nextColor: () => {
      return "#881111"
    }
  }
};
