Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80C98343910
	for <lists+linux-next@lfdr.de>; Mon, 22 Mar 2021 07:03:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhCVGDD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 22 Mar 2021 02:03:03 -0400
Received: from mx0a-0014ca01.pphosted.com ([208.84.65.235]:5830 "EHLO
        mx0a-0014ca01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229944AbhCVGCe (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 22 Mar 2021 02:02:34 -0400
Received: from pps.filterd (m0042385.ppops.net [127.0.0.1])
        by mx0a-0014ca01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12M5gtiG018795;
        Sun, 21 Mar 2021 23:02:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=proofpoint;
 bh=f0bWMCCszRdlWh4M9xwCwr8Cg1oLTzodxoleplys9IE=;
 b=JFflzFubHIuK4Ph1HfrbjycM1Py4Ei8SERGRZRWgnxpSaIETdYJ3z2KN/1ooubMiR4kO
 DjtCILbL5yMmipGpSdUiqsmOViALF6ysLlzBHXaIohFTMWTcM+LJO3vwt84hK7+zJWQB
 dswmDuOapCfNIDY6tsv288oFvMIQALj2lpjM0LzRC72F+P51Q3YIvRWXBrhIqVXf2mwH
 PwA3fVGv5sbeToiBC8BDrnBLXbER8apLwVZPY/3iqZaKWdJaG7jaFQfBzsr9w2AEGMrx
 FQYnkOZCZDkA9Wgo4I2prwhRg48BSJYLSyqKRSIHoRFUF6mHW1r07lspb0BVEV8ea5VL lw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
        by mx0a-0014ca01.pphosted.com with ESMTP id 37ddkxc4uq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Sun, 21 Mar 2021 23:02:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pi4KnRlz5c+Kuz7WRYvGpo2XHDf9vQTXdVvt6HUQJKuyu+fTcdA8ef4Kdpx0tC7dRKGflT7++4aCMAOMUXiv+OTzXB5AEb1Sr9Kq0jDs+y8TxzgYLcpKlajhlfgqZwVpnwp+Opky465Thpq6x6i7RmH+iEdSXGn2HwvCxQAK/AND3+L+7kGEff+Nw6CIXQS8duPAwl/xwnGVG5K08aPcqKMaVS+hH8O4l3cBuzVO2KEgCWjeKc+jLCqCPGrdUDRe0brqaXulJDgMcErLCkFLFE3eVTRPKBvh5Tm9rIC71ACei3hwNo+GY9uRE1H29jZAgZU0scioXORYmIoNBQ32Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0bWMCCszRdlWh4M9xwCwr8Cg1oLTzodxoleplys9IE=;
 b=aBnJIKSJlxlxsramBa71VWpQ6aqWnBmzX7wwqDFBEp9rGveEfdSaffwPlzgZavbG95Z8hua+HXC4OMKhIHnicOEcsVzcOMW1Iab/yqPHu3oqFBwKVdBTrBF4/ec+9+jFr9uTr/LcewT++H9tdLIv2cHGY226OsTTkOyOEFwCSorjEcZ/6sROaFWplGaeiH8nNgvdZO88mxpL6L1KNSI+odPPOF3f5xueeyov8akcMJIahZLVm8mcud5Q/VaI0HBiRe3hh4zngbpsrJrAOlNTccslPMmR1RpVqM1CiGWq+G6OE9csQCidftuNJ1q46K9nLrk80aIZh9MwhXWhM0YEiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0bWMCCszRdlWh4M9xwCwr8Cg1oLTzodxoleplys9IE=;
 b=rbmP6T+V19UItG1zVIbzwXX/AVNiA9Xpk6g7mF62dWMz4H2OL1JahlZ1d5yIntQByS4Lgc8KhqqaDiZCspl4yA0Puf9lRNf2YHqVvi+GfpYYRnaFSUqXBUOhYpP1pL4wa4gf6oGpHvtmzHaLGoV/M1jA3KY3EizTIq39o3WcDnY=
Received: from BYAPR07MB5381.namprd07.prod.outlook.com (2603:10b6:a03:6d::24)
 by SJ0PR07MB7712.namprd07.prod.outlook.com (2603:10b6:a03:282::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.25; Mon, 22 Mar
 2021 06:02:20 +0000
Received: from BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::5a:c16d:31b1:bcd0]) by BYAPR07MB5381.namprd07.prod.outlook.com
 ([fe80::5a:c16d:31b1:bcd0%7]) with mapi id 15.20.3933.032; Mon, 22 Mar 2021
 06:02:20 +0000
From:   Pawel Laszczak <pawell@cadence.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Peter Chen <peter.chen@nxp.com>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: Fixes tag needs some work in the usb-chipidea-fixes
 tree
Thread-Topic: linux-next: Fixes tag needs some work in the usb-chipidea-fixes
 tree
Thread-Index: AQHXHpPylwX6juIPW0+Gdqmwrz2QP6qPgk1A
Date:   Mon, 22 Mar 2021 06:02:20 +0000
Message-ID: <BYAPR07MB53812093379E4370B572A142DD659@BYAPR07MB5381.namprd07.prod.outlook.com>
References: <20210322075108.3967d5d1@canb.auug.org.au>
In-Reply-To: <20210322075108.3967d5d1@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNccGF3ZWxsXGFwcGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEyOWUzNWJcbXNnc1xtc2ctMjc4ZTI4NjktOGFkNC0xMWViLTg3ODctMWM0ZDcwMWRmYmE0XGFtZS10ZXN0XDI3OGUyODZhLThhZDQtMTFlYi04Nzg3LTFjNGQ3MDFkZmJhNGJvZHkudHh0IiBzej0iNTMwIiB0PSIxMzI2MDg2NjUzNzcxOTcxMTYiIGg9IlFRVkpsWjFzcGxtSHdrUXBqaVZzemUvODFLRT0iIGlkPSIiIGJsPSIwIiBibz0iMSIvPjwvbWV0YT4=
x-dg-rorf: true
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=cadence.com;
x-originating-ip: [185.217.253.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba2cba06-4f8f-4841-4f95-08d8ecf80e2b
x-ms-traffictypediagnostic: SJ0PR07MB7712:
x-microsoft-antispam-prvs: <SJ0PR07MB7712FDF0050082209D463D71DD659@SJ0PR07MB7712.namprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ovrb2LADtzz3ZmiZYXpMc0wwv6M6SvA3jJ66Kq2iJcURsDK9C8JzKjjKW9l2oPM5ITxATu/bqlDRWzBmfvNfa7NNpQKiP630JjpDDLnykF/PJos3FpsUMad5pS/zKrXxDSJGUeG7KnBg/++rUj1arwpQFdUlz5jFrVShaq7a7J1IiGSSKWiQKW+TjKimySK5Y8FdJs5wlYzs72c5TqdXmR6lC3hKvNEZRxmUTx8R5zaFnlBPRV6CGFejDRfkfsez/6TS5stqs0k/tCEKn4PgRtCXc/HadPQFZBETawjxVA/sBM37mrQAeGXkLTteoBGnoSAPhqkt+BOoIpimCQNlpds33mTKjqZyL7hd7ShzW5PP8Fni0bgKc4VTNxmEW1LKG7veOx3lIyCzlwxngqpv79Ae4UDMsIOfvmofe1cEceLa2kmWOb1SciO/Q3KxPU+vMSETL+5XlG1Szub7kt1YP/pMBgn9/Vc/MYOUnTuAWRI2R/cgSFoXEfjBw4ZAwsfaL9m1+vTgfarsjsb3Z9S71MQbrUAjQmrqpOjf3oSf/J7zgx+tz7F1Dsv3fbCpe3tLxc8twOisVx2nPR68/elbmQam5yNBRZC8NetACOVnWhwc6UJHVQvARX2w3Gli5jlUJwVxd0XTLrumtQR0bdUWT9jauJG98OJpfHablCMPwp/rebueJayoZFhOHohFjdWB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR07MB5381.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(346002)(39860400002)(396003)(36092001)(6506007)(83380400001)(52536014)(4326008)(86362001)(7696005)(54906003)(33656002)(110136005)(478600001)(71200400001)(76116006)(9686003)(55016002)(186003)(8676002)(2906002)(316002)(8936002)(66946007)(26005)(4744005)(38100700001)(5660300002)(66556008)(66476007)(66446008)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?puKEvcR4LnnlHgKnSbCAD71hdVKDanE3F3BL70td94YA+lU81tC7xIvymISB?=
 =?us-ascii?Q?6h6XoED/bP9b2niN3VsAAZa6FlYQT7AFWyJdhVu7phzOg5ykXumqPZT9vfvG?=
 =?us-ascii?Q?29rh1FBin3LabRJf0u/1Dv1dhQ95oEAVB3wlf7BYPuYY74iz5VB2A5FE2Q/u?=
 =?us-ascii?Q?JXls1Cn4VCh8v13VLA1zTCLiHcrAuzCsTXUGmLt9gRUeZ4RlrQLsKoDZAM1Y?=
 =?us-ascii?Q?Zy7hQk8KuwWCdqwdna+hgGtMymE0xPGUcDRQdchBMuDPZ6mYXj2DyHiEKko7?=
 =?us-ascii?Q?GPhCq3UChbKABeoL4CGD1UUK9qQ7i3ICGW5FI+t3ZsX2yugDegdp80pv8Ugk?=
 =?us-ascii?Q?p4FMC6bu37p4uNIJWYTuxjbp7d3HqVfBzcnpro1pmjHY5ttQXiMAyPwowruc?=
 =?us-ascii?Q?QQ/bx3m3+MxMtosNfmx7jfpsWkWlLJRNLAEAh+eiMp42yX42S1oVGIwH2dbg?=
 =?us-ascii?Q?ReKznEtzbKEuwYHVeIdapw4hjlnJxcE4nTnGO7RdL3HDj+VQLH/FNjv0Lqhn?=
 =?us-ascii?Q?kDdz8jGv/aU2Fa2FrxFDviSFklhSCDwDmuwngz4s6my/5rQud9PUkI0pxQcF?=
 =?us-ascii?Q?Raov+zEO8vM0lEuenQu+5sTi+ebe3vs9eYq4MkGAiFOiR+4wbjcOsZyx9sB0?=
 =?us-ascii?Q?LIopFyU0nP0b8B8mB/oCWFunQGuj+cJSRyyf7nkjrqO4Sejd1wkgsltwqmF+?=
 =?us-ascii?Q?H2qJARvXcNh/2unLmrSfT3/39JWruxLI2t+7ypam4/6hHTP/Ylxa/ShoXyPl?=
 =?us-ascii?Q?BLbgsFtJ0VSP+VeOQe2WbwSdFIo9lDpvw5QwId/95dxAPorIDqiN+R7Ynm8Z?=
 =?us-ascii?Q?eSuQJQXJ7YrZ98jus0uXCrwqoE6UQEd4OkRaKPCVJMzgynM458F+4MatXpDc?=
 =?us-ascii?Q?SGMa1CqBwAGo4bFIqa+VvPLrblfG7bPXWGP6/eEKAgbR6K/Q1C3lp5X46+wf?=
 =?us-ascii?Q?Xybhr8C0qHl4eomT1pODh5nsfeD4i6VqDxYPW8lz4EmWKGXvuFhVBlscLsQo?=
 =?us-ascii?Q?9tTYDXxvYEQ0kWpvj1+lIRSrr8TRD+wimgvP4MfYHouu+M4lwWBpn72up5k0?=
 =?us-ascii?Q?+Q9RBGrT9uTKrGGY+N/U9BrcQcbg6D8m8GsoicHnIR94sNRZIJmnW7+/0P93?=
 =?us-ascii?Q?6g/ODRJmASKwMwXGG2R3+RgL2+20BFwqRAeOFnSbrbPU+y/Nh7qiV9DeMjCT?=
 =?us-ascii?Q?Mc1apRC135JbXi+cuwy/JJLj1BW5I4ZhmLEpGZ3LBJSPCloRCy4ntVMr69hl?=
 =?us-ascii?Q?Jx9S4bLvKUchLGpLRHAY5FwM5/ZEpM41WEe8J1ITAtMJ3YTHIduc+5EkZn/x?=
 =?us-ascii?Q?nvvtch2srx2QyS8o0UEKZpzk?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR07MB5381.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba2cba06-4f8f-4841-4f95-08d8ecf80e2b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 06:02:20.4810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bSYiOHur3WzCOXpVMQZxUjcNj6Mp5wl7chgZEONP4ydJwGWUpybrWfdFCMlvJHc6tTph9p96iM17ssPYHaGJzHaunICxVAio+PDI+I0y18s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR07MB7712
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-22_02:2021-03-22,2021-03-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check score=0 adultscore=0
 phishscore=0 mlxlogscore=890 clxscore=1011 impostorscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103220045
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

I've send the new version

Thanks,

>
>Hi all,
>
>In commit
>
>  67a788c7c3e7 ("usb: cdnsp: Fixes issue with dequeuing requests after dis=
abling endpoint")
>
>Fixes tag
>
>  Fixes: commit 3d82904559f4 ("usb: cdnsp: cdns3 Add main part of Cadence =
USBSSP DRD Driver")
>
>has these problem(s):
>
>  - leading word 'commit' unexpected
>
>--
>Cheers,
>Stephen Rothwell

Regards,
Pawel Laszczak
