Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03FE443E507
	for <lists+linux-next@lfdr.de>; Thu, 28 Oct 2021 17:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230344AbhJ1P0k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Oct 2021 11:26:40 -0400
Received: from mga03.intel.com ([134.134.136.65]:29316 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230201AbhJ1P0j (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 Oct 2021 11:26:39 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="230381014"
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; 
   d="scan'208";a="230381014"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2021 08:24:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,190,1631602800"; 
   d="scan'208";a="597837372"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga004.jf.intel.com with ESMTP; 28 Oct 2021 08:24:11 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 28 Oct 2021 08:24:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 28 Oct 2021 08:24:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 28 Oct 2021 08:24:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pz5/5UvDXNwtaTo5ZpYS+3fyNX1vjhKov0VLGhi3ByZQBrrJhMfrYpU/+nAjThKX/bOpywhsyYIvVEF7omiEtOU5OC6j9ocPAspu2RXBsRVVVmv5MazLGTxMH8AzuD2+bli/kcFq01hmAI1TkpLdbQ7izLm7K9A0UZPAizZhZEjFRKYbzCR+RI0v8srSEdoGRKiSBVLMZKi7FyqL0H2LmPx6IweP1eowIWdYpIiBNT9eWZmq2usR+rWLzgK68Ee153o8Aa6cWe6qKAD+GsQwqJzvcFtLoJSlwiaGLi8EOK0wyhofAjbYWk8vuzTHFbxkIc7XXeuJoSkI6gHgM3aEDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJB+t6MvJtmgMM0LCEmA7H1ydQhgGvGST4H1xXVS7Vs=;
 b=lSAULFi+mgXLm4iE5jx/oSHidZIUdk/NUHwR5k8AebZZjbwR1tmHU9q5DLKRcgAZN9lTfxefWUBaQ+ryZgWsL8P3yeMNjbm2nMVdl4bTzzjFMl5t/bte/OHoKQ7R036/TmY6iL+8YglSfFLNGv0f1M7KFliAK9usBCk1+RhkChm/fXzYGgPygExcDdU2TwTaZw4CfzhyAWQtgZtcn/QKPiPgFGFHtB2/HRc0kK90oBxVvsfnHbrhlYnOVfVJ07sgbLaWtGS7f4qBYPgrUu/sZoU1klsX8KOgNp5bURh62oWf6HRW0cMSvesJK74hSRUgt8MGOwe7EqBZbe669OtTFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJB+t6MvJtmgMM0LCEmA7H1ydQhgGvGST4H1xXVS7Vs=;
 b=d+e9s6rb4A4wTZ2EBHzbx/TUH7/Tlw1TYv5OR54I16HQXHRWc3EXds+Vv/orlLgIWJFbaOHvecNvzHFRLQA0X9ZzGYGt6tu3PaENs2gnLjKfonOzonJFeQTMeHZCGHmkuDLAXiK8tPix5RQesbMxFZsbqkzpwlUToTxLyCYg5UE=
Received: from PH0PR11MB4855.namprd11.prod.outlook.com (2603:10b6:510:41::12)
 by PH0PR11MB4951.namprd11.prod.outlook.com (2603:10b6:510:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Thu, 28 Oct
 2021 15:24:09 +0000
Received: from PH0PR11MB4855.namprd11.prod.outlook.com
 ([fe80::11ef:b2be:5019:6749]) by PH0PR11MB4855.namprd11.prod.outlook.com
 ([fe80::11ef:b2be:5019:6749%6]) with mapi id 15.20.4649.014; Thu, 28 Oct 2021
 15:24:09 +0000
From:   "Bae, Chang Seok" <chang.seok.bae@intel.com>
To:     Borislav Petkov <bp@suse.de>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the tip tree
Thread-Topic: linux-next: build warning after merge of the tip tree
Thread-Index: AQHXy/cnctIR04op4kugrT4cPYQe4KvoXzeAgAAoagA=
Date:   Thu, 28 Oct 2021 15:24:09 +0000
Message-ID: <8CC6A777-F228-498D-A2B8-AA8B30B9A6AB@intel.com>
References: <20211028232651.31c01c86@canb.auug.org.au>
 <YXqekxadmoKZJPW/@zn.tnic>
In-Reply-To: <YXqekxadmoKZJPW/@zn.tnic>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.7)
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 072d55be-e5a4-4053-cedc-08d99a26fd2d
x-ms-traffictypediagnostic: PH0PR11MB4951:
x-microsoft-antispam-prvs: <PH0PR11MB4951B415EBD139FC40E954A0D8869@PH0PR11MB4951.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ptyToNC0eMt7JoZFUxeIMWGllvOCCogx6oTs1IdYbLJ/4hqVBaQOrCEeXalMfWC+Gk1gbGpsbp/zQFTk6g4QF4IVqH8S0aj8SKzb46lSgOjyiOpcP40DatCf9DjQHf0eMNc+PeZGou3hOL7jcRcT9LkIxCrPn1i/LWx1CyI9r46rKJVoLiSe0KBh2B7xJJr0r3BBzat6zf5VIxc8KRYMCW8bu1slMXHtA2ULhn+xCdMXcLDc0b3qx1+WPhGTFOq3kYaBx7GMiRBU9jaPOkWq/B3NSW8ObIkk1F8jCqNIL3SZ44vuOeMWVMtVuGIBVEpc9uQhFb/9IzTlIUhYiKG2FwwoTjUHLwiD/8ODcIj0JMUMS5FZ8dO2XZc1WfgxFdtdxzaWu7tVDntRUTHAA9i2DMK4tKAtfLiYnWV1paQdVAd7bTrwjxKFSxYm4WwbdJuguTyFDMrJBGEF6/zDf5AYWpeIj1okMataGbzf/cpcYYM4EQ5+evLeTFXdAlLcsjqnOA6mQ4FMr0HCXWZp+Es7YMlLeVDXgtCuRArwb5E7g/RboASYdpsoFf66V0qL/UNdIhJ1tdztHMtAtCsqnADbMi+16UStz75riVmc1nBBqdR8s5OG8GUfoaeOCToprwvXo7iS3czQ/1KQNRLjFcGuYx52bO358Ib2vKVhAFWQUS+LaXZR/rnqap8LPYWMXA6Mr2YD6kQlJV5VaRKwNp2bQeLJqirMOW9GTeFRuY1XHe0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4855.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(86362001)(71200400001)(6512007)(54906003)(6486002)(316002)(508600001)(4744005)(82960400001)(26005)(83380400001)(6916009)(4326008)(6506007)(53546011)(8676002)(2616005)(8936002)(33656002)(38070700005)(38100700002)(36756003)(2906002)(66946007)(66446008)(64756008)(122000001)(76116006)(66476007)(66556008)(5660300002)(45980500001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ja4fjC+5anpPhuAFXIsiSQ03pE7zFMKGNekEPZxL4GDWIGTYXOq9DerVXpEA?=
 =?us-ascii?Q?+M/5f23Psoo59Nw5EiGpIFvtsbKhxIDT1AJr7hebSfW8n90B05jeTVtdFmAp?=
 =?us-ascii?Q?RI18fKLNZ0kht7LSK5Fx08jvX1VgWLq4UqTo8gOlyOwXJTPMQmTLNwwXqb++?=
 =?us-ascii?Q?eX2nJ41IYNBran2KpJx0QRVHk+dpQpkUVXTdO1CaW2D9ZMQz4QeTH23HKox8?=
 =?us-ascii?Q?FNclqyNQ2fSkAT/I6861sc3PcpiBN6yhnUoK/6kBM0rNXMO6iL97Y4gDiYgg?=
 =?us-ascii?Q?n09f2cPbJy5x7jdPjZw6K45eQVJ8VlU1TYSutDCTZv/WPmt2X2tSfrQZWogT?=
 =?us-ascii?Q?gEDHrL/Gg5RwTp4IrbkLu3+FbIXtt0SX6uVx9kpTzrtIwIZ0f0EW4Att9zIp?=
 =?us-ascii?Q?BqJqfSCnsPJYLISjj0cWXMihA8npRTtmjd7HjmEV+l0lWLXTf0VXKohzzJ1F?=
 =?us-ascii?Q?1RtlY4Vmv1A0HYWHU29HU4stlct8OfCcsGYXyFdmVpaUUB0WIoY5LdUFUmom?=
 =?us-ascii?Q?fs1IuVh3CHhZTicBc9ofpCAs7366dS4xJ4PHpDKrsCQ1JEZdsZfomzkQEmXO?=
 =?us-ascii?Q?TjsXiqTorEqUuDDU5qFTRfFAZ1IWr2i45hT2TUxFFNSZr3baAgPGiuVRXRcN?=
 =?us-ascii?Q?AFb1NN22jp8PrxzML53pRelMScaZT0+C7tz/Fj3U9475BUEcTxM6nbygm0lh?=
 =?us-ascii?Q?He4VGnPrOZ4QNGzj/7OVLdZVaGH+uQ5i9GQLuz4TBX4L/NtAkWJEBt1h0eys?=
 =?us-ascii?Q?2JJVsiIvjCYcA4QTU9hM/hYPENLd7Ih4Rc7dxpOYQ5P3WdeZRHXb9ofYCYYi?=
 =?us-ascii?Q?qgACVnTw3uNarZBtJoojChA84Q9P90kDd7nLllh2I8G0aSeBChCqrs+Y5gXq?=
 =?us-ascii?Q?Smo707+l4/HyB4SrTqPtilyJp473LckCZg9G/RwJnTJRAISuZoatxNZbgpk8?=
 =?us-ascii?Q?Gu5PcWF1LyX5MFYXR5UDyFVBEkg8RzfOzBZgnpBP5h5KUov9MQi0F3/u7jWS?=
 =?us-ascii?Q?xNPLEKzy6cmRhYccUji5zrzNui6hxvTqqPPsCCCOv6shnnfPalwO6JMTotks?=
 =?us-ascii?Q?H2NCfT2L1q+cC3HQVa9B2wo/oBBvsKrb4jXK022Mv3OVCgWqenXYo9pl2Mgz?=
 =?us-ascii?Q?JYvxdoK4EpaAVccSE7Sw4CvSE21LPIm9apdM8CNwrgs4vEZAGI0IR6V2I6Zv?=
 =?us-ascii?Q?1/tbw+pvmd1QsOIqBnrJ0x9BOGThrZgjp7ahEIl4DOxftpdQcKjpdFna9Hh/?=
 =?us-ascii?Q?gw0GUKpKSDspz/ll+LcAaORXCxdhs9miriSI0fsDyGNw1TrtQQH5/wkGVByr?=
 =?us-ascii?Q?xwcUdnZZCAJ+G20IEoNjdzSFHKpP/fA0DwG4UdyEo8BU50re82MF7RlGoYQ6?=
 =?us-ascii?Q?hi2J29HJdgURZWmXVNjmjGnsFajtu+gECl8AFzHMpfaPJoH4m2ZxAZ4BqRS6?=
 =?us-ascii?Q?IjNJm+ApDmoNZHVVX8sFVrj7jZulPiRRl1HEigAkjvbOl4eGe+14P/VH+M4O?=
 =?us-ascii?Q?IcEdt+5op3S+sbkKWkWjjNFY9CM0u0btbarur9NoJhjlJ+v/SjPQnw+QZ10I?=
 =?us-ascii?Q?5LSYtzCUhZa2Btq1vigaeej/HS6yf6OkY2WUPgCHskucE6Gu6Z/Ze4DZxgDt?=
 =?us-ascii?Q?qcqszKxH29LAmtkeqWpAR11ibuk/x26/ugdngC646pP/31sD80T/4yCIWCr7?=
 =?us-ascii?Q?dJFvfgP6hXL5NckGbV92iCXIQ+k=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FCE81805DE5CB84EB4E4F475049A7C32@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4855.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 072d55be-e5a4-4053-cedc-08d99a26fd2d
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2021 15:24:09.5125
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C2dBv4BA5bWQhNlzQf1ju4S4a3GJJyzFImV1Xb0HqIDxwQpv4SKol61i7zi4XazYMbu8zJqe/oBDmfrrg1aIED5aaqWbm6E4Q5ywp55/R5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4951
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Oct 28, 2021, at 05:58, Borislav Petkov <bp@suse.de> wrote:
> On Thu, Oct 28, 2021 at 11:26:51PM +1100, Stephen Rothwell wrote:
>>=20
>>=20
>> Documentation/x86/xstate.rst:15: WARNING: Title underline too short.
>=20
> The one time I don't run htmldocs on a documentation patch. ;-\

Ouch, my apologies. I should have caught this warning on my htmldocs run.

Thanks,
Chang

