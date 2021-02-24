Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8B083245E6
	for <lists+linux-next@lfdr.de>; Wed, 24 Feb 2021 22:43:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232744AbhBXVnG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 24 Feb 2021 16:43:06 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:30816 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232397AbhBXVnF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 24 Feb 2021 16:43:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1614202984; x=1645738984;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=oIshEiwV083u7BTLsfclpYT3cCq6O7rf7q3u+cYUbtI=;
  b=OXvKBFbf6+AK4jdY/j2iYZuWCnjjrYZmsyafselyp+ncyXEfFbM/7HWx
   /FoxP78uu3uNCq9UDbsQSri6KgKVQE2gGTOy/gZypr+ptfbOyVYhyVwQe
   9Jg9Fxmo0cpphfzLBKaaZ/ehmSPDg5iJ5q4FD0R+PEmzOo4ZELLJgtpW1
   RjzmNNA4uulukZITMndDADMBOW6IYKmtFInU5cybwXveq8i1oqO90+V4o
   hWROPrU5kYPpllpVYr98CtbtBRSpI6Wkm9UbmgSVKE5phtg87cMAJ4qmA
   UOjZeIas3KTxJMEqwvgNKIo9JSbNQX/P5yoYVOgd6Zg2oh0GQOyq2PD8t
   g==;
IronPort-SDR: EtvclbCLLI1gxU64/ptHrXyxxWuk6mmYOqOgrCBIJ/IdvE6p14Ymd1njbohAVEB2itpvTxmwPy
 vzu3wb9mXl43LlJzuJilbiHc9muZ4pZc9/pVWKLXA3Hqe4H3/yf5G5Izq1KE3WT1+RUHIFvUHU
 Cu3ggwuXAzPX7CgLweQLU9Njh/t0S4CY7W8dLqIYNbRoXhv/Sz3Y/xclYrEQEacXv/VHiRQX56
 QC71FzaUkiV50lU8le+NHFPMlisSBpUtLs8zs2z2WbqV0X1YbwjCt7ZqZlJfa8uG8fhIsbTVUn
 HZ0=
X-IronPort-AV: E=Sophos;i="5.81,203,1610380800"; 
   d="scan'208";a="160744393"
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
  by ob1.hgst.iphmx.com with ESMTP; 25 Feb 2021 05:41:57 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IFuJVJuPfz8JPnLF6D0Yy5qnPSRtqNYs3+/5V5qR6ug6RcSwbx+1tqTJIbbbmaUB/TFuvDuGcHbiInR4oK5fsdY2Cd7CH6aLunxOjE2iGC4GcWEh/G+V1VlwNFRZm5rnuUDE308pEHnVNXxuI0Exg8+t6xRpmk5Nz54yiJZMYEAGZkmx7/IGkBoe4kQ/pw8ZWMVXzhi97CB3Tql4ucfFfveTaH0tBS+Fp8wtcu4BXVjvpIaM2i3wr17bUkFI22mdUT7A/hHtO18aope9fQdKJllB8ypHYkNd9PiJgVZCHhfb8BzdIL55Bd5EPBTCkgF4OSOIgN3gT4VyCAZhGKfZ+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIshEiwV083u7BTLsfclpYT3cCq6O7rf7q3u+cYUbtI=;
 b=bD5JmYLjnfqE5On8Manf0uMOgJw/HN4vTiAySsln8rLjRmOtLt6E33C3jOl7o52z8rS2BBpCmGZCY1NFpsv0hxe1fleBq8THvJKPF7psJW3+eB/WMboQuIt6Yo5ng1Ss9jtua6Q4dEmiJu2k87jXnF8E7EfBgH7SLUHW+eQDy8S1p3Jj7YNCegAGPco7n22J7caAQtZH/wKaUIIhDVgFFISQ9hDxkOD/RO6aR88onDerVcYiwFYwirXNVBicGFwSIIVCSNHXKEez78dIauA23gp2kBPHd75yrHHgVvK0wayHUmQsqjXVNscNcGEI8GESqbeaTomATf8GF8yAJkmF9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIshEiwV083u7BTLsfclpYT3cCq6O7rf7q3u+cYUbtI=;
 b=dEoom3zEZ/LsOhj/JSmsMMrOjgQTrETzuerix8cDSM5G47ZqJchFT+1rpkFtGE70yCsd9GMz9BXDvz15J04QVhmVDo99wCf7956Q/KML9nnS8oubP9WphumfGymKqeG2SMsJmKOKZPPEbU94uO2H9SKOdTbG2mFQ8/zz0S3AmBc=
Received: from BYAPR04MB4965.namprd04.prod.outlook.com (2603:10b6:a03:4d::25)
 by BY5PR04MB6852.namprd04.prod.outlook.com (2603:10b6:a03:225::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 21:41:55 +0000
Received: from BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c]) by BYAPR04MB4965.namprd04.prod.outlook.com
 ([fe80::1d83:38d9:143:4c9c%5]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 21:41:55 +0000
From:   Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the block tree
Thread-Topic: linux-next: build warning after merge of the block tree
Thread-Index: AQHXClUzpjkXmk4Idkajps6jemEJ+A==
Date:   Wed, 24 Feb 2021 21:41:55 +0000
Message-ID: <BYAPR04MB49653C5807D8EF047E3DED10869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
References: <20210224133140.5f02fa0e@canb.auug.org.au>
 <BYAPR04MB49653608E4E792BCC8804616869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
 <20210224163320.2d8d810b@canb.auug.org.au>
 <BYAPR04MB49657DFD56D260A9D58F9E9A869F9@BYAPR04MB4965.namprd04.prod.outlook.com>
 <20210224214254.1e5e35f4@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [199.255.45.62]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9ddff1bf-8293-479e-f140-08d8d90d018c
x-ms-traffictypediagnostic: BY5PR04MB6852:
x-microsoft-antispam-prvs: <BY5PR04MB68529F9966094180AF1BA86E869F9@BY5PR04MB6852.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C65jto9h8fo+ArJN9tVOc6aOkzQr6q8C+CuuATfR+l7rwk4kRxVpNgnMXnNkhFXZTJ6OXhHen4UTIYafRGG0pKomSzjgFjsSjxXERMaJTivaMkaLI1bRT+CgO9qgIl/N3GPho41TSUBiOvL2hEbaHq6sg1MCLQVF847Ll4Emq7sF8KgekzYDfV/7m73KcPFObEaTlvgqJBh/mVVjiaOcrq4nalhi5yYejpHn1uAOtgttjGekAXpdJwJm99WK+rZKY4j+XSitA1HL/J7SvDumzE+JR9lg5VI4594G4SaheDpD6eFU08VRdNoZfQXCDMpvpVVw9+Ow7sBEoMOGp/b9lhROMp77QF0RBinYvOTr+rcx+m7qvO2CGX3Nlbf4SSXeYL4KuHnzyax+JlErp51ZDq0+ENQ52kY7CekafqTzaUI5Ina5ayujxuOPijQ+by/xFeLfUljsQwWtG6sUgdqUhF7BX44dcrOet2hdcdjv2b1+EbpXK1aflanWhiQiyE7xzBASuBu1FW98WHrt3S+D8Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4965.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(66946007)(66556008)(64756008)(66446008)(66476007)(86362001)(76116006)(26005)(71200400001)(8676002)(186003)(4326008)(6506007)(7696005)(8936002)(91956017)(53546011)(33656002)(55016002)(6916009)(5660300002)(52536014)(558084003)(83380400001)(9686003)(54906003)(478600001)(2906002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?K6LtQAh/TV2fFMYmy51Im6M4F+W5x8OhuUqDJPlZY0v2+sODcD6aNeHO4nEN?=
 =?us-ascii?Q?WhM5emESchyP2W9QvTy/eQ6NKiHSZ5Ua6Kpp8fI2nVsQJXCgj6an9cEvS+YE?=
 =?us-ascii?Q?NtPhf9yPpK7PUBogW92XobzfnbdJMJRItz7mz0CAx3Y4XNUsNexMXQvdsgvn?=
 =?us-ascii?Q?z1goRKDyUxSmS2XeARmCE1hEp0+Au6Y0Yk5CkthInTU8kanRb8/7HdN+VUOC?=
 =?us-ascii?Q?2F4Enk76LO0Izo9FtWvAO85l8i98uAq8HYH/REOG9Vd9Qvu98Nk3/m1+5MKI?=
 =?us-ascii?Q?3xpzsLoMU5rSqSxFmViS1vrch5mN7D7iGw5iCr93fuRVB/ryrgx9xEc8IoWo?=
 =?us-ascii?Q?ZWoo1ljMqzDGfeqOzJPzRVZ/42WM2+m3bi7gTWGN94gaom1+CWpFvYacNk5s?=
 =?us-ascii?Q?tZBJcBZCOQ5kkPB1mnGmaSF0mDcTPHxOUHVnR5QPvdHhxX33NxoAcou8bNta?=
 =?us-ascii?Q?z52+D412SfYjtiSkCNCiBTf7fd5aHPko2CZDRd6fygEZNOdYnBTTFpg3jqtV?=
 =?us-ascii?Q?WRj4GPHDvS/Bi919lgIbRx+405FlYiTx59UwZLwOcx7S5pykxZjpKDfmik7/?=
 =?us-ascii?Q?sDqXT6fCAjUGFQwN8MagMjrjQEkeXWz6MUw/Km6AmgZisFjUcaOld+Qc+HqM?=
 =?us-ascii?Q?MG2Ssk4DVF7e4Iw2xU4mTMq6pjc7uu0tdVonapZ08UNOiJ3n7/uO9I2B2rVK?=
 =?us-ascii?Q?UEVDwVZlsYrfjBa3pUqBcmJk+QXrkc3azGTqlPYpZt7Qf3A5jNFS7p4SzSzr?=
 =?us-ascii?Q?uacU+27NJk2ccKrD2iKDPnCepyIE0F1oVrUmRQl2ZQD4A7O5STkHAFkGH6Yj?=
 =?us-ascii?Q?a5tgfRnpXNqKrNJSf+sCz4GMVFrpweV8a5fpnp+2z/ObjLgW4JFa+AH18sXP?=
 =?us-ascii?Q?nJfa0j7b8PpRCCkQJHf55qplzJnSU+dwaiD1qRes+J77qoVGU7C851YxkVDo?=
 =?us-ascii?Q?Xubq6800QX6IjlHLI+uyVO+/NNUgmHX/VuiqhIwhLNEHy2EHidS7eGeRUQ8/?=
 =?us-ascii?Q?1Te8lM/rfldMkp5TFIY8HFgVeLunwhdagI/fdCsnpqNWi+m+8Q6fU8AE6bzf?=
 =?us-ascii?Q?C1w0puxq1hTOyFRsPWl3lVt32YRVMuuK4L93gPqsdBm3ihNwb6rVddfrkcBD?=
 =?us-ascii?Q?S5NSnPaGWtSQKcN3Vs1XdURjMCLAkUnlk96JCiU59f0v8tfOR+7oyosb2Hoa?=
 =?us-ascii?Q?yv1SEz1KxVkysnUe3uaTk15/NtCmpip4Nt0DElMMUIu8c7DYTSp/Flou8Zrf?=
 =?us-ascii?Q?D2tYoXTDxnDByDmdW+MnEeVSGUDHjGEFvkn9QWQvtxokVIkJX+/7FbVnlWo8?=
 =?us-ascii?Q?ullGC//noIhzk2dHTh98WIR7XvziG7cK4XHK8ppeOlb5Kw=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4965.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ddff1bf-8293-479e-f140-08d8d90d018c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 21:41:55.5971
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sdFLokaMbvAc+IXKEN5/wrhQxJjor/98/KJ/DLrklif1W55txuCPIzFW+MYAGGM7q3TOo/VVbMWiyKYeeRB0I8gJ7s65s+pXu4PF94Fi9pY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6852
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/24/21 02:43, Stephen Rothwell wrote:=0A=
>> I'll setup doc generation using sphinx on my machine, is there=0A=
>> a particular command line that you have used for these warnings ?=0A=
> I just do a "make htmldocs"=0A=
I did that, please have a look at the test log.=0A=
