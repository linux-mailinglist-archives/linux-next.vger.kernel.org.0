Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DADE40D108
	for <lists+linux-next@lfdr.de>; Thu, 16 Sep 2021 02:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233393AbhIPA5f (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Sep 2021 20:57:35 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:16388 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233602AbhIPA5e (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Sep 2021 20:57:34 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18FMjhqD022916;
        Thu, 16 Sep 2021 00:56:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=kPZKEqjWOjIITzyUB4tnK+vC28Q18o7ay/52z2bXVKU=;
 b=1JtHor7KvU8SG5w/PBeNNGPFwxX8UAOd6vb1vIbQm8kGjW1US+QZOt9qYCcYHMDe2iSq
 yr+YuBnAGZwR+4Vgc9cyV75lAXFGx265ImNsFE31DToVwCDIFie14ScodvvZ8O/UkJUB
 f5qqAqgbHFIbTcqnjZvpNXes3nLYlHXfdHJEY0OKsN03YSl+2GMChPZBWQQM9wWS7dBb
 9T+ApjgdDm6+XIZzSHzb46P1dpNnDA/iBQaCKO9xqfxF4IzJLemg0aasx7SbabFoPYEX
 Oz0doH8SvE6KBcD4sviC7RZW4/QJldSlxl8/NBU8jQagvqHMTByLhy7BJFGvkALv8hOx Ig== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=kPZKEqjWOjIITzyUB4tnK+vC28Q18o7ay/52z2bXVKU=;
 b=bUwS9L9doAnbmFUbnNCxKmKlmAWAlhFV+4doNWUhh19ta0ZITZec+fX3sNs6ZS4Ej+IF
 iGg+tycfFXy2Wrjps1HLHZLclEEOjCWM4Szs8jnhc1oF5s7kCTWdnwLNsWMnoLRiPMnc
 /yLprnKe+0u93d6f4937AEo4A/Bq6TIeVR+zTvkQbYqSvOxvRJE3cYj/nfCINZqoF77w
 IflNlCqWeZJeAUTA8OsWnWpUNEaTMV5gh0D+qPKOdMOEtnMRjiNAW7JIgPkRNrpGxR2S
 6TMaWo33JLwn2rKTpQCZ7sSOFrl+lMJheym+PNqxB8XJ8I6HDmDuFbtaW7eST05pNu6s AQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3b3jyshmev-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Sep 2021 00:56:03 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18G0tEjc077864;
        Thu, 16 Sep 2021 00:56:02 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
        by userp3030.oracle.com with ESMTP id 3b0hjxf22b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 16 Sep 2021 00:56:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMomLFyLE+8TkJMkpEGzmKs0aoVAgkKVc/sk1aYAPWMapMSbxdEbPjq30w/i+TQ3ro+F2oT8NGWXiZpwaHPgehOxEPX0pPvWZFwrHSrHFvIUmmgolasdAZRlXsLxNeDp4er9gFnQtX69oMSK5ogCknfhXEE19HmimvE8+6iO6qJVE3QzzPv36cUsMR2I3l1oSYj5J1VeAB+xjNKLBm5DFapRibcJC5OhujJPbYRHdflS9kVisusbjZXUEcSuRP8dDpuua87KNyyAWOkRT3Xmbt0qR0MdYzBMKKcfjSh753SXK86Qkeby6VmRZwGpBntfRpLiP5K8UXYFY+aeeYYkxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=kPZKEqjWOjIITzyUB4tnK+vC28Q18o7ay/52z2bXVKU=;
 b=foUJYO/KVV/UWQKv1/2T2WRxFoMvjh/5mwB5dTPi1H2Mwxsnh3JHc8B5d7liO+YOIbSVXupNip/iMcmc28oz53Eq1oTX1F2dnSkMvOlA+LMowcWTrp5KilpSXC/Fw77I/+pZIguP5cGMvAq7qfCEzSpbX6ZsmEdBdFSQKATBrvBu9WERsIQ4sKZPUwnjqiE2hdf1B1suoxHOewcAKBdO9AfKmXx9EeWY1NdyOgEPm67i5n/PY0Nl8XXexYmjZBJQpNmBXbVv9tEj+rnV6BVRdv8jffGxWb1pUE3gHGIWzw5mewus05C7Hv+nE/R1FeMDz20LXL2R5GAOIOgAb2Hs3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPZKEqjWOjIITzyUB4tnK+vC28Q18o7ay/52z2bXVKU=;
 b=NwbNYeimD6t0LQzGl2ixoXsJG4yujAgGvY1ajrTH3xrGu6XWYNDEP/X7NU9LZfMj8g9W+acW+mvqIozhrSFgkM0guDArMs6CZPwQYLMNMhSzGhKWmxhSgbLPImOjf/ajkOUFbqkXfdEMWpNO8xKd0Cg0/QeK4LABjqbZqvhyy4M=
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24)
 by BYAPR10MB3269.namprd10.prod.outlook.com (2603:10b6:a03:155::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 16 Sep
 2021 00:55:59 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::f4fe:5b4:6bd9:4c5b]) by SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::f4fe:5b4:6bd9:4c5b%6]) with mapi id 15.20.4523.014; Thu, 16 Sep 2021
 00:55:59 +0000
From:   Chuck Lever III <chuck.lever@oracle.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: error fetching the cel-fixes tree
Thread-Topic: linux-next: error fetching the cel-fixes tree
Thread-Index: AQHXqn2mXbKsKIM4DUqsYqeVECjJp6ul1j0A
Date:   Thu, 16 Sep 2021 00:55:59 +0000
Message-ID: <6186EFA9-E3A9-491D-9A00-411D2AAE7064@oracle.com>
References: <20210916080407.6fe9ac3e@canb.auug.org.au>
In-Reply-To: <20210916080407.6fe9ac3e@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=oracle.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2a903a5-75f4-4910-7c8c-08d978acbfb5
x-ms-traffictypediagnostic: BYAPR10MB3269:
x-microsoft-antispam-prvs: <BYAPR10MB3269644613B4C6A757C49BCC93DC9@BYAPR10MB3269.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9y2ds3E0YqcfUm+ucUfzwBOwBR/1eXUEZ8dSclCseK11z+pPZupi6KCJnR+9YT6GGSGuKJe9I62rWKdQhPawyFu9dg6pZ47TXUlLQYnssLRo47BitMjkV35ZojnHXtviCBXsX+TQ5kCK/aQTghUKxR5lH5fw+lcyOVY/7uTeKhyWVXJMsJ8olZVZqt6ohOxVfxgxNtePV6Rgcs/YPR3XkjADEhQsLqYUbgflT5uedxNQvOJLGE4hQU8SuWtJ6gGqUh2Yc5JQEmVzdPfUMrL1lU2bxOOU07+yZgpUhIEvpdVpK5xHs6xLCQZOufhAjIQ1oMQ7HOiZ+sRkHGbdQRGla3cFgG6uG2YfNlgA9/QAIuFAynn1VXRln2bAPJTPKXVsk07flgv042gKit46pYLPe3P1IeMSOmLL6Rr6TTYehiB60fNSa5pSEq96GyGm0fhFZ7BG+6cyVmeF/Xy3CsFMKLbxM1E9o2F51nRc1Eip9HjyUEZfP2aN3v+5DB/QY0RRe5BjlVN8CWOfqZkJ5jjJIP0o1OTkh5F4ITclNSP+FKWzMSUQtqzdHr5Lrs4XoTeBOurOHyR88UjM+fRR0MuUA0OXfBXU5v/r0sxEH7j1Ef4bVwNl4BnJNSYcOhasP+6+UdYeEXwSZnOxcWWg7QS1LnkCZFe6amink5iAPe9XH2jjawS9h3TrZ4hH6TYCFSp2TvWFGLEaiakgs2ETw/46rAJr39Du2ZKYVuVWziL0cs4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB4688.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39860400002)(366004)(346002)(396003)(136003)(38100700002)(6512007)(26005)(186003)(66556008)(86362001)(2906002)(66476007)(36756003)(66946007)(64756008)(8936002)(2616005)(6916009)(8676002)(76116006)(316002)(91956017)(558084003)(478600001)(33656002)(122000001)(66446008)(38070700005)(54906003)(71200400001)(6506007)(5660300002)(6486002)(53546011)(4326008)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8LLZtG+aPn9/2i7UB15NWwGOOWwnMeUF/2/25ElsFjY3+6a+xM6PEfu3RcUQ?=
 =?us-ascii?Q?66uDi86Fn9lRWRDHNe4dECuQqFwyKqf4wi1ipBMvi+1Rqkd4FdADHECscx/D?=
 =?us-ascii?Q?h6vH/IQQuECAEfEDu+b4mQH0EqT4K1HTYbE58IJP8CbxD7451JcuokNmdzDM?=
 =?us-ascii?Q?kq8e9MUob6CFbMX+a08L1yQ/h9vP0RIa8U0c+oQtWXHT+f+y0DNqxgAY07oI?=
 =?us-ascii?Q?ExGju91m30XNR0dBemqs30z5ZWWLCmhFXEHLIoDEpCideHZjNg64cAsdxONb?=
 =?us-ascii?Q?LhKcAIh4MPW+E3HWOA2M+/xqYx8pbEuXN84a1ssy2v/6ghqhzmuWFjDvJVi8?=
 =?us-ascii?Q?FK1FP5adOTYm5F3dbPzR0iFdbWnKDO556w321eBy4zlzmvYqN+x5Ir0+1yLA?=
 =?us-ascii?Q?CGljKY7gvIW/LJ4K+ADbVoV+F0g2SBYeyX1VPaQX1NMe1obN6s6YkGaIp0Gi?=
 =?us-ascii?Q?beGkpC9PyhDOmnZPNhD2+SccZedpq75a2bhMEEYr4qbONhyaRZoHopIaRGSE?=
 =?us-ascii?Q?oD2NFLPq8IeO1u2tZBpKRhrnYNiVBrg4l0fdnYpdMS2vDGQkh7clTR6Cyv2L?=
 =?us-ascii?Q?TxtUTQiNs4yPdhprGdrOHLArFKuk6tTZqJuKV8gSq06wmO14pzvNRp2AonRB?=
 =?us-ascii?Q?0cv+EVAv3Lp+tV6vkLPAzbFccWL9o+///FDPjPQVi1W3uSFEi92o0ORPCI7v?=
 =?us-ascii?Q?HmmJ1HopHMAO0yUMo3hzqM3VPXi0vbqE1vwuCpONSqOJnLo4oJrqaduCHhel?=
 =?us-ascii?Q?7fhhvHI65q68HPrdQf6rXUdXALmk24MOf38+a6m3cNgxluF3MGeLMLzRw44b?=
 =?us-ascii?Q?rFYAX2cuzYcBLwkCG77aVPPVBnQ2x47cl867s5a1rOdsVYpJ8sUmfGugAPyb?=
 =?us-ascii?Q?3u9s7NR0KQ8Ls91q02GZMzSL7/dW9FbTW2iF5/s5DpjKtvJYtk9EiJQ3KeDU?=
 =?us-ascii?Q?ssyzUbpkXN/vep+Pwr0keVvU6Ck9O0vaRZ2KRfgrX0TQ/qHTegSmjQGnFvpJ?=
 =?us-ascii?Q?oTTEnPD4oegKmOo5yu2VX+Dbj15PwVREmYnspQeTnB+2wPUj8o2nTkvVgsi4?=
 =?us-ascii?Q?mrJ+FfjuV9u3/oSkBxFLPMkYxWcOwOODi4hvrmuFh7pZ0coSzaRO0zL/e669?=
 =?us-ascii?Q?fk2hXhM6RItCGiy7Mur2abX1F/sm2ALpMBE1yqR9madIbh6YClL2W5aLLsTI?=
 =?us-ascii?Q?2nyTFO+4YGSkrEF/PUjS6yHLCKOlkV85p6EzvS/xKhS6xuWRmhAJ36jmSBRI?=
 =?us-ascii?Q?bDCa5DESoV9sQziserTvMdc+sAcG+cRXoupnmF/4HV4ydBQOKU1H47YOGh+a?=
 =?us-ascii?Q?9+RUeGC+cnPmCD1tw9tzBN37?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <004E56D1A8A2BC428940EE0DFD276969@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4688.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a903a5-75f4-4910-7c8c-08d978acbfb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2021 00:55:59.4580
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 44RPtGi3THI9hc4/UwpaSgYJqMSqSaZu2H8sanesCrSEglrg4F/I3txKjLkOAb1zqCoL3MWgdSp5n9895JPxBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3269
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10108 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=840 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109160004
X-Proofpoint-GUID: Wq1ysOHRRrLODAneMWw7wNKsYmXF57mp
X-Proofpoint-ORIG-GUID: Wq1ysOHRRrLODAneMWw7wNKsYmXF57mp
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On Sep 15, 2021, at 6:04 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrot=
e:
>=20
> Hi all,
>=20
> Fetching the cel-fixes tree produces this error:
>=20
> fatal: couldn't find remote ref refs/heads/for-rc

Fixed.

--
Chuck Lever



