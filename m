Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B363AEACD
	for <lists+linux-next@lfdr.de>; Mon, 21 Jun 2021 16:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229807AbhFUONX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 21 Jun 2021 10:13:23 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:47638 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhFUONW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 21 Jun 2021 10:13:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1624284668; x=1655820668;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=JzdMoLhm9U8wKaDlhhQHxy6ESWhgSYmoZt2VgKMTEgs=;
  b=xe34NaZznZEs30Ks8lq7t6n0LfEJtWL+8zRFqBMhsu3tdizuy+cxn6Pf
   Xgx6S6lHjWX1TgYR2Mc+AYoADFIO2gkehdzcaUUR6SduZs2Jx7IW2yYuc
   zo2UiSVJKqoRguldrPBIUbl/PZqxFCjQU+SD92sHWr6ig0TBt43N9K9uW
   xeV1IUHnjYEqPPXVure2lrudAs6H1ANBh1HtbxM+VH58He4TPXKZR0qBR
   cBPgSwEXV3kwMKJJf2Pj2j/DvCdf9ZJAFE62Xtajb9LeL7qpPWlJo36M8
   ziHHei+OHMq2r7iaz9lLtVFnebNnrh1uNAmvICoSAj5J7pWhqHf9i+d93
   Q==;
IronPort-SDR: T4fm80c5oavK+CCKfOGDqAbbot9Y+pDqpaQ64uHukU2K8kcYn7lVHxmb/nKAT8MWUY8J3kAN5X
 oMl8lxVOvM4E2y5VgEK/+K5pumdWGa12ciYZCGUT3se/6ZCaqfDPc0z5TU+qU29h+25YNiJq56
 c90kV6d2Duf6/piMbcAN55xUEbGijWecnWIHy7LM3/QvgYjoCdVNHLb226AQwh0ngCMCE2AIl9
 aldtC1+2b/7CWIQnf2bsoqkuOfHrEqMI6t61oewta9L/hz5FgMXFmQBbPB4c0xTwaj3sfeSf85
 jic=
X-IronPort-AV: E=Sophos;i="5.83,289,1616482800"; 
   d="scan'208";a="132845927"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 21 Jun 2021 07:11:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 21 Jun 2021 07:11:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 21 Jun 2021 07:11:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ck17nvaFYUCnH+4l9yPUKmVmi5VO660dI6JHPMAFO6Q1g+90X1Nk5l1vLK10ZmUwtATIlvPbuBUMO1r9jorED7YwdYLCFKVVWyNtYqboheDLBcOJDwXg8Kg1uS2x/+eDyv/1qhLlEr+AfaxfCOQBXsgam48M+N0Np91KdVDxqv50/bCGRuJvKxQgq9abS/auf/l5x9JTXAKNn8UGmyNPvWT88SbdpOPRqIIq5Edsq5tnp7kbkR3shOS+IZAM8qZccAfO+/3Q1SEblb407vqfgbBb2KUsDXM/fbkpH8eDDSsHVUMXmIFU1JJ+tpxqfpMf0+vdLb2p3LMvJea0/0DD3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlxavXb+1D/iCevLKcdFd+iOjhHFtyI3050gEckrq+A=;
 b=NOLL61oKmNy0CJD7+BhZGArRwYUZcgqrsUbdd101hHqdRhb34i/B1ZehvXKBSzQWTWg6j1EtbCbrf/Mlbw7L30Qg/aFWiIZ+ak9KvVOXfvq5Id33sB/9pkWXeZqb76vsOs/l2OY/xgsWz3Ay0NKwahUI3A05kfLYWYpzIS9mrbZHb2ARu/dl4fRvSeDqPALMIBkRzvDOaDcm4EZFQir/a+md8QQ6Q5iXiHrvrSHuD8fq8ckUjs95Rs3E0cxCwx4XCxRRnQAIs0o79hSEwvtLtlyBqBe3zN0Fr6sdfRIqxSq5a/75ZAFdXsJiyPOb8CEIqtvnQ/8X/KggXKBX9asBsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlxavXb+1D/iCevLKcdFd+iOjhHFtyI3050gEckrq+A=;
 b=sTC47aWQqzCt/rln3L1yO2cJX/Rni1B6gRmrOQ2b0g1FZgR0H/bFiPXodaoRyDPF7gtLy1nv62gpQ7uIHeRcu/AFXQtoIs2E+lY3WzMRepiRw1Is+o7V0YdPRogXuRd9SozHeAVp9Ep/UYxEsKVoPvAcGfqBod8INElRwstwMh8=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by CO1PR11MB5139.namprd11.prod.outlook.com (2603:10b6:303:95::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Mon, 21 Jun
 2021 14:11:06 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::44a2:b703:d98d:df39]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::44a2:b703:d98d:df39%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 14:11:06 +0000
From:   <Conor.Dooley@microchip.com>
To:     <sfr@canb.auug.org.au>, <jaswinder.singh@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the mailbox tree
Thread-Topic: linux-next: build warning after merge of the mailbox tree
Thread-Index: AQHXZmJm/nxxjqF2Q0mnTXqtl5BXRKsegceA
Date:   Mon, 21 Jun 2021 14:11:06 +0000
Message-ID: <1b6c7de7-3e0d-1812-0a1f-4e7106ad83c3@microchip.com>
References: <20210621155752.28d0524a@canb.auug.org.au>
In-Reply-To: <20210621155752.28d0524a@canb.auug.org.au>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [89.204.252.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f7d86c6b-31b1-4198-8703-08d934be691b
x-ms-traffictypediagnostic: CO1PR11MB5139:
x-microsoft-antispam-prvs: <CO1PR11MB51397B7AC8D19E5095CB0B99980A9@CO1PR11MB5139.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1824;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wGlc9iQG1PGw+aJEAmRNOGhrCNH02xOedOyBpd6DfJR1HnaSft0de1OfitdJHGc0ZVsPIN8UrcKILLx8qFF4/ZnGw/AF8+lxEbRUati8tWYCnBAxGDWT0mdSKA7QR2/l4NHPXfZsalRExO1prJvQRdgdlxJtVXf6nlz5F0A/53A62X1lIr9lVnVRtPVtWwrqSoKSgGXrMIlRVLUkDvm+hrsbk6i3X2Exs5hd9OWnvSqgJTD8tLh6igvpksoYgaT3PDhMAamyBZ0kvRmD8l1n+M21tXkCVoEsZWTQVnwMgffc08m8mIu/27DPZ4MqAI0Tj35vQ7gP6A1wKcBCsx+UuAY4G/JafI0mirBQew+kexRCQGCIJWprVjYCCiLH+qwSZmnN/ItMZa0TLZIKBRjwI+J23dcZh5X+/9MH/+45XH7nmZR2Gox5cmnsz/zVQwXuZ2zC2B+9yCAsWEOVp7XinDIL75RtDR8E4k0V1+bAB+spjIxxd3+Wsc07TVLa90PCwO6U0avNDdim/LkL1R+hHd3renkARrB8XIdTete0XZxQB+ZubEoggfXQJaVNpPZXNciWycZ8Uddt1cpv8hIGP0uTqIbfH/PURIqMk2+tGJveXFPifJ8bjaWFPgdOisggaoYgaMNxYak/evBlrOGD8/TWiZPyfbDnyzaP39SeJH6RPyfxhD/0503HjLjRi7uq
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(366004)(376002)(136003)(39860400002)(66476007)(66446008)(64756008)(66946007)(66556008)(5660300002)(4744005)(6512007)(71200400001)(4326008)(478600001)(2906002)(122000001)(6486002)(38100700002)(53546011)(186003)(110136005)(83380400001)(2616005)(8936002)(8676002)(316002)(26005)(15650500001)(36756003)(91956017)(76116006)(31686004)(86362001)(31696002)(54906003)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?ZJYgplbrElXPffflqX/l9weMHopSpN17ujfM/Py3SRtCzEEh9Adxw/IP?=
 =?Windows-1252?Q?0DqVo5QakwL9Er0ZVo43md1NKITPipv5pu1T9LAgX5/LHb9JF/sGsNc8?=
 =?Windows-1252?Q?Qn+kNUK4HDnK0xzc2bcRbYteSSLyw2Q7JjGdj2UZNYhahWDvWSKflLrD?=
 =?Windows-1252?Q?Nsya8R4Yo0CvUnCj3WCfJDuSTm88mBhUceYQIcIQotlAWihnqKmUhan6?=
 =?Windows-1252?Q?VmMduenCrDl4o9o87UHD01/2IKI3V8ouLVdV7zafEFQ81dV5ecBseFk/?=
 =?Windows-1252?Q?Ss4mLE0X+iZmv/k2yesPUJJMAee6iXr84IcqsyErffDk3vdo55ypVRxG?=
 =?Windows-1252?Q?/PMG+46hAkCuDSfA71+w73M3Hjg5hAhrAqkOfpYZnP10jaBZSu+8y1jm?=
 =?Windows-1252?Q?MY18/DG8EzTquZHKeRt+TT+GpLQNBqVTbEFnFu33PggfO8wBWYabp2JM?=
 =?Windows-1252?Q?QAhs+E49MH4sI+PrGQJCJTaIh00KGhjxMEPZUPlSEXQ+A4bW5+RMTQJd?=
 =?Windows-1252?Q?qRI5emX4s855FeD7EDCA/WnS4njHLZkJmFeN8xR7HGVYtVkPXcvV4N6q?=
 =?Windows-1252?Q?cvifgULDENBXveZX7Xv1vhReBE4oSrMEcjLGPMNiEi7HVx8Iw4VkFByo?=
 =?Windows-1252?Q?QWJaGuj4JJG8sJmcjcDpn1vo4Y67tJeI4CBSnt7uOlPO41jWfVMLlsA6?=
 =?Windows-1252?Q?0Q8R5i3iBvOtrrgdLLpyReng0eVfSHrDSMY5g7UFm1N26F0cd3z5JMC+?=
 =?Windows-1252?Q?SzhnAJr59vo7ee/dru8L4nZRFuRVgfoJsWwhfMONciFQ39+chVE3z0Wd?=
 =?Windows-1252?Q?tN0Ms/2OGJ4vMHIB9roXdS/pfGppBK5/SWuUyC8OYjsDrRfTbuwOsqTy?=
 =?Windows-1252?Q?pTXOGkQxOlcT6MS4fe41rGunw+YQqEbsT0UfToR5dkazESgTU8SodtOn?=
 =?Windows-1252?Q?twozVCsPVk2Qa0QVK6L3MlZG8v3oi3b6a3Pru4xPd5UAo3Utte1h7Eq1?=
 =?Windows-1252?Q?02JWvU1fq9+HMAXDNk15SC3bKeQoZ/N7MunZN/l5jAeG37ZVi0WvPsrx?=
 =?Windows-1252?Q?pB5qcRG6Hzmg0Paip93En36niRpmTHP5RizDqMZa2WiGyIaQqXOawrVQ?=
 =?Windows-1252?Q?eUijj1CUzJ5uxVpyLDo/0SOrPD1HGUvlAhmQY7ucon6KFDkZwOpCsOap?=
 =?Windows-1252?Q?aKIhCld4z2mGPhN13aPEfx7USJRJpOx184EOASHunnSpiNVHgOnc8/fl?=
 =?Windows-1252?Q?beUPzwFNe5uOq1I+/bcY1d+qXp+xSZXN525dYUfIqkM7CWY6TCJwRv7l?=
 =?Windows-1252?Q?2tAPzHSYJj7OFHSvzUbZ1PGRpBbqzOvrK95NkCGZ3ukvHHTvRxAw94VF?=
 =?Windows-1252?Q?f52bT8yMpZeQj+jBktFBourL8imhthDOeKY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <D420A881D91A724BB7657C1D57453CDB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d86c6b-31b1-4198-8703-08d934be691b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2021 14:11:06.0870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u3LkWc1eXfR37W3DFVqImmdNW0MxBCo5mpXzNQgK+2JbUHV2xGTt9whvRRNVrbkJ1+7axf7PGYwVSrTst0hsATCp59IXQkRcpwcNstCnWMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5139
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 21/06/2021 06:57, Stephen Rothwell wrote:
> Hi all,
>
> After merging the mailbox tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> In file included from drivers/mailbox/mailbox-mpfs.c:19:
> include/soc/microchip/mpfs.h:43:12: warning: 'mpfs_blocking_transaction' =
defined but not used [-Wunused-function]
>     43 | static int mpfs_blocking_transaction(struct mpfs_sys_controller =
*mpfs_client, void *msg,
>        |            ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> Introduced by commit
>
>    de5473936808 ("mbox: add polarfire soc system controller mailbox")
>
> -- Cheers, Stephen Rothwell

Hi,
That function is defined for services using the mailbox, and since=20
currently none exist it is redundant. I will move it to another patch=20
series that adds the services and resubmit this series.

Thanks,
Conor.


