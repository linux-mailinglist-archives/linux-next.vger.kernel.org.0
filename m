Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B06353245F9
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 22:52:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235669AbhBXVwe (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Feb 2021 16:52:34 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:7026 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230330AbhBXVwc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Feb 2021 16:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1614203551; x=1645739551;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=1BWFmzQXHfcOrJkurSe1g/81zJXmsxR2OgwfCgjkQYg=;
  b=m1178y2JhEG91ECHily6picHHJX5o7KbM0r7UjodAvyfWMprSvXK9yML
   4YWt+q1L46FVSdc8jNSltgaYmzsBaP/+PCVYDO53XDma3NUp3FedRwhP+
   KSUrgx5/8eWvFSGdSzXYcTellZWB+H0INv8luivhm+p12elOaL0y0Htl1
   diklMZiujSBkn3YaS4OFG8E2vDYK3IjkMnbdBpPpiO+Ff1Si/Vo3GMfgc
   gdXL3hSBUGIagDvqbo6a6UsrHpodiARpQCS+TLZ5+zWpZVm2r9UoNybuQ
   jaqUNvG2MA/6V+Pb/EoFld4NZZlKJMSl21JDxOJlPK6LvuZXeNzhfcVJ6
   Q==;
IronPort-SDR: 6pTi/SxN24eq8ziAhJoO6CiLbMe0rDcY45JWEuRBe/oCMcZBh+6p+nobFBY2tW/+b5zi/pDXrg
 BydaPIEHFkydSRyeW5HJeC/En93nh0ATvRQv0SPrCDtalbiTOMbpLA/uLdMxKMvTTZW22L0FKE
 sjZ8MdMNPB7hdHjUrB0lbSwcXVGbgNPc4FL81EN+EPaOS+WKm+moJzgRQxh004HX5LksIG2kyt
 YOrCFy3iY3kUTzRtuSYrzd+s8IeKCgmPNiUvDIZ30vl+O3S+5Odl9NYxhVN6s1Sz4NxjOKm2e3
 TfQ=
X-IronPort-AV: E=Sophos;i="5.81,203,1610380800"; 
   d="scan'208";a="160718810"
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
  by ob1.hgst.iphmx.com with ESMTP; 25 Feb 2021 05:51:25 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eA9jRLsfKpmHdH1LSoz47W5Lnt7W9PigyJdkgm9npCW9QrL0xQuoi6mHQzO+Lf5TlRCZYeZw7H48X02dsXZOh/5cC2O3mmC/2ylcp1mSjfGIJHX/KFg8xcmwr1ASbu4MXE4N1Dj4uIqayCk3Trh4QTStXeShKYv7eAGXuLOGP3aJQfWITIWhReYg09J1cKfq7bKvay+z2G6CYEB1ZMrn58zCRPxKfs8IZ/lsUhs3gZOealrw6FGN4UcvyclPlkGkDcOdU4l1dpAyCt5YpjVyrQKGgLxUEv8YbN7pES31d3NRzuX9oumVo0UnUf09enQw4fDP3gBIEkFOFz7W2LKLmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BWFmzQXHfcOrJkurSe1g/81zJXmsxR2OgwfCgjkQYg=;
 b=lt5EdbHMVkrQXXXn5pVadV1O+oJLwqpEpPNnalHZmEl3Vqjn40HiaCmRbMjKMA0dETxTUiEbB3PiQoLcijWqq9XsZzGxQkutCrkxtvlCfDX/n5GL7oM+QochhNA0w0NavUq+C8tBZ/K+nayJQdB8fkPmaAaEbFZujpHBVx3iPjQENvsnMx8VEYkEBOMPqfhg9/NXqVTV6xoqiHvfYZvrpO6pqqF2NGeoVoEbcYnBZXdq/wlzv+PH++wSciEu4+0oNnagmZamu62HSePLMW7R0IHmSpigcasFHGbmRhxNxsHdVBA5AeJPldh7hOfXUZba/AIDcqN0oK4e7AYtlxQ0NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BWFmzQXHfcOrJkurSe1g/81zJXmsxR2OgwfCgjkQYg=;
 b=c9GKTg27L6XJ6R4Vc0fQsZbTK3+D59G22WguT2KYF+sG9KXY/Eg330Yq8Zz4whs2+WAJQH+AaVn2YbF6vHyEh7eo8PZVNQ+Bw+xH53Aa30GMa7WAheylP4cAWW/1Gm+69dS+9ZK2w6wZ79zAvEw5AR6/3VjjXvImx1CAZJr8+k0=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BYAPR04MB5030.namprd04.prod.outlook.com (2603:10b6:a03:47::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Wed, 24 Feb
 2021 21:51:22 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c%5]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 21:51:22 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     Randy Dunlap <rdunlap@infradead.org>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Thread-Topic: linux-next: build warning after merge of the block tree
Thread-Index: AQHXClUzpjkXmk4Idkajps6jemEJ+A==
Date:   Wed, 24 Feb 2021 21:51:22 +0000
Message-ID: <BYAPR04MB496535728FF9A4DD1984E94D869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210224133140.5f02fa0e@canb.auug.org.au>
 <BYAPR04MB49653608E4E792BCC8804616869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
 <20210224163320.2d8d810b@canb.auug.org.au>
 <BYAPR04MB49657DFD56D260A9D58F9E9A869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
 <20210224214254.1e5e35f4@canb.auug.org.au>
 <BYAPR04MB49653C5807D8EF047E3DED10869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
 <6985bb92-88cf-8e1f-97a6-c42caa3b63af@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b6b51039-5d3c-472d-1a84-08d8d90e537d
x-ms-traffictypediagnostic: BYAPR04MB5030:
x-microsoft-antispam-prvs: <BYAPR04MB503047FA9FD2FA5D2767C621869F9@BYAPR04MB5030.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Cc2Pkepe9FFfxNWmFzbiPxMgFl/YJS0ma9DPpESI2RlYKa3wu/wwiMVOrZB/TNHYxDGc/UOiSABl+tZoN1C7ILUuvxJlCedj6TgrAExf+J28Z/mLKgYcCmySHLEwtpfPQ9hqTib9qIZ7hWgBQryRToOlMSrj+Cawk4F11t+sF0i6FkGs3biF1CDqEW66V1YIrvCYknjMx4624pFFNaVvczwgm7jQchoBDMclFAiNG6rSXoDA9iZn+BccktDtvyRzTofIcEDG6vijKQTB/lVE7ygH1J42J1W8ZKSLqerStf91AX25y1ABPYCJg3zGPVSc/e4/UFcT8LEQlKavgRqr7cNFj4Cu59MzeMwvloFgAfWzwsViMQI4JaojblnHKmv04QvL0dkLk2YPxv8lOOilgWSkmdXCI/Gux1/TU6qLV+DmZI4KbdKaTVIHXD57fVW9hxTAm9GO1zGf2UvsHRJsV3B3KmiF7O4rfIBAthbllOZIuaXo8lDIIUEWxNHJdjB8W4p9mZXSR3stTwWmcNOyepnT1jO0XCe2qKnskXY4tEE+H2OMn53oGuMCIslFNTPX6EBXpwMOGjB+z1xraokj5jTRiJMTVoFyvP3dqyphAabBCPzPLeUFyVucL0AjZocrkdWWuZiP9/h+VMTtCo1BuQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(136003)(366004)(39860400002)(86362001)(33656002)(52536014)(55016002)(186003)(8936002)(478600001)(6506007)(8676002)(53546011)(5660300002)(9686003)(66946007)(7696005)(66446008)(66476007)(71200400001)(64756008)(54906003)(91956017)(2906002)(316002)(83380400001)(966005)(4744005)(76116006)(6916009)(4326008)(26005)(66556008)(6606295002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?+quEK73KAaomF3lyhvzBRLtKwFMHQsguHRSB0DAt6fFv+aXQG5SyNG30ViuZ?=
 =?us-ascii?Q?R/nQ6qqS2zpK5GMBmVNOPzhDlqBqQIWuT+pPsgIb0BRVCp0CSneKRjxN9rdC?=
 =?us-ascii?Q?Jxr2ozYRysMBLqaWXyw6vcHUYSJ+YiOUPwFYRjbdXUR8JhV0OEXFqV4logCM?=
 =?us-ascii?Q?KY4e4ni1nH9Kc+QHsZtf8D3Ig6gCK4TcyI9CbRfwMmaAFyK6J6uKkGIqFe4g?=
 =?us-ascii?Q?UNjQy3HiwTlJvSWM2SOBtmzdzXEi1AX5zSxnSVyU9cmsoHKE45Abi6+1lDHx?=
 =?us-ascii?Q?/evmOIq6q6ayyiVIyzN4YT5zM2hp/da0DhB5L/An3giduV1Fv3mdE4iNmv65?=
 =?us-ascii?Q?mqUBJUuzgmujeQv1p0wgyZF8xw6r2kufTzrIs+nzCkncnMm7dOjJtLqLcZwK?=
 =?us-ascii?Q?KOk/Zb71iEXbNK5molPKEFQ0HOjvMmy1UgiEiSdaxKwkWkFJ1VkicuxvfiyF?=
 =?us-ascii?Q?6DBXuo+iU+qM/9PHkbN+N7XxzBCvEyR2cScEoU67LOkYVA3tE3fVuZLd09i4?=
 =?us-ascii?Q?v2hp8dEeCREcUSW4SbXiqGZPNEkfGp57cNbc55YXWAJocQK9EgLgD2/2hDBQ?=
 =?us-ascii?Q?fJactZytWEzMto/Z2QyHXac06CbfgBxs/2kzE1z40EaMSclXt7A2QQFzblz5?=
 =?us-ascii?Q?Sd9VOpcf9x8596M8in8iZMJLqGCkmks017bTQxdeAnnV9OD7fvbeiqHBMC6V?=
 =?us-ascii?Q?i3mOBc7fvEzgve1B6J/USSvM0UG6OAyGzrgfu5nxjs2cQ+8YpdIfKcUk5gLP?=
 =?us-ascii?Q?sv4NgX+6TXXXM82/L0h0uiRVnf8zbzDbr7sgfHKvTqWe7upluiOlHgNDyu1V?=
 =?us-ascii?Q?XT10f8Qxzj9pNZk6Lh8xcJqmkaXaKO6dUDHHoN6BqrjYb1QsToAWbJUqYJjM?=
 =?us-ascii?Q?nvufiTu2Dllcv4NGVIkmBaUboutBI2SyfmKl8VtIGYtCaqiMuECrNAnZUwMU?=
 =?us-ascii?Q?Ki4EUG+0y5XKQaTkmq5X/bM7TIg25zBvTq9/FxbY8R+T6e3bnFJM1SQmDS1D?=
 =?us-ascii?Q?qhlFKOAMw3SByIo2QNWhs8HEFcWvQx/D4hy3D4EYtkv2cmFTYRER+E8S3xx9?=
 =?us-ascii?Q?oWc9SbuLMjm16LWrfLuipDE+rhMmZCFcwHFYaJoVnhQWbgm9n/8CPl7mRdS3?=
 =?us-ascii?Q?tEHXausgt9C2lkBRo8VYmEwv53nw4H8k1jjFRdYKGiAljb4aeHSGvELX5vjq?=
 =?us-ascii?Q?jAexVztH8m68rXY9e9qlTuv5opvTiTYmbrJgmF4pNag3JXeqvdkBK0h0kjVq?=
 =?us-ascii?Q?UNxAJHMfsuEgK7752sRH5fs5a18mf3U/bVTAupDn0VE5Opg3lFCE9StD6vra?=
 =?us-ascii?Q?o2S5RlobOzWVhNM++M2gR2fLucBJGcfXUCj/B01EDiiz6w=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b51039-5d3c-472d-1a84-08d8d90e537d
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 21:51:22.5612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /t0Pb6L2ltJD7yzlXXlRLoXqva1wVWm93V+lvSt/Zfpp0+0dgZiTbBpNf4xLWbz0j4L/oGCKWhyJwuDT/fd1D7IaGEu/o+jE9zpm5StDsrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5030
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Randy,=0A=
=0A=
On 2/24/21 13:45, Randy Dunlap wrote:=0A=
> On 2/24/21 1:41 PM, Chaitanya Kulkarni wrote:=0A=
>> On 2/24/21 02:43, Stephen Rothwell wrote:=0A=
>>>> I'll setup doc generation using sphinx on my machine, is there=0A=
>>>> a particular command line that you have used for these warnings ?=0A=
>>> I just do a "make htmldocs"=0A=
>> I did that, please have a look at the test log.=0A=
>>=0A=
> Hi,=0A=
>=0A=
> Where is the test log?=0A=
>=0A=
=0A=
I sent out the following patch yesterday @ 23:16 PST with Stephen in CC=0A=
on linux-block :- https://marc.info/?l=3Dlinux-block&m=3D161415113122092&w=
=3D2=0A=
=0A=
It has the test log.=0A=
=0A=
