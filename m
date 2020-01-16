Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C88113D144
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 01:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729112AbgAPAuN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 19:50:13 -0500
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:38287 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgAPAuN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jan 2020 19:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1579135812; x=1610671812;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=UsoTCZFe9w0bJttnLAUObGcxOfhXWNRr5vhk846BWTk=;
  b=Fci4S8MRPhBpRMumFPJGN36HrOInt2BSou9MZuc6q+tejrho5Ryd2vLS
   7AN/fw/Ts2HS5Y6fuIpa84aerk64iMDqVJ8TbG0leOeiqjoWFb0C+fSbb
   M0EKQUqOYK0MDIYQOiwLvlLrK2+lgBv2obl9HOjFBmbd/AjRFQKGEaJDu
   UhR0+IH7Xde2r4Xjmincl0Nid6By1iIZYlgDEXwi7xEuiFpN7LllMtX9v
   aUxvuZrBbxtISW3LvRr49RE0gGduvMZxk/ILPMRoWOTZCNm0P5tftG28f
   FiXwswzdUtgx19fDlm0XuEGSnZyxp6m2ST/A7CmajwHOACEpKJJMXTJ6o
   A==;
IronPort-SDR: rUCrzriuLOnlbCPCLKSxDGauQWlg/zw21zI0NAioX9bb94jl+y1Q8nEaLvXyFZdgVBBHJsZ2Go
 q+J/8/fpRvTm0u1YGxuAIqoZXkF9NarZi1nKCqgJzOQzNHwnn5PSjqEHYvicYv1x0PK8cKmuaj
 USnTO+esOpBq0SSLwKLxjpFRKRdPR3adHkQlI4atoBmNgGYXzuSgGUPljhRlfq7GBhviwKQZqk
 pJ9FMCIncrKoWmdG7fAAaRU5Z9x45576mwMqQ62OTGxpEmyOHM2l5nyu38TVUlYn8tJqHsjmcw
 pBA=
X-IronPort-AV: E=Sophos;i="5.70,323,1574092800"; 
   d="scan'208";a="235412238"
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
  by ob1.hgst.iphmx.com with ESMTP; 16 Jan 2020 08:50:11 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipQ3StBVrJGG91mT6h0Os0HiXjxUyp4Ooh0fkKmcHHSnWD27rYkKWJ9kau71ehgGJ+0Pqz25gZJit6oClU+R+S0CCaP4GX3nl3bys1qVIachXyrvd5R2M6Kd0A/TEIJUmyP4s4HRSqh6owfa6/9YOzIJmvUXeOCPraRkSyBtvI4tSSbFz6ydtcVNd/55/6uS08cBBLdsR112/iiFQgRq7AWWdEh/W/DmbfhME08qgO2BZNg2yjyvPUKueDVECfU0S4pszWiMTSksikhuKthL6XGG4XpFrrue0kJMAtY2VSamea4Md9+QT5OX4HH6bjDBAGray4+Get3d1Lz0Ibl/3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UixKbmTt4tIlcNqLLBoF02a8o5Ay01KoJUQxHgbS96k=;
 b=IbQ2jd1IPcUM7Ggm2HwLIKOgur5NBmaJ3NCwSfAu5AuqI7vqOSQ7hTxQjAhDS8bmtwNFdP6ZqJYLU8d9ymoD3suYIE/65ADgKMI99a3YYTHAUEY2svJCKu2jp75l9ATcDrFMhUan5wsvQRSSLYOq0hNIH35Biw60UGyEHPJvcTtgMES8ymLgRrML0JLtY5z2aiMEAPeOxLlGh+eZmgodm0Tn0xlsdvi7/yb2CKP1jjoQ6W7Gy1q+aNzM1LFHkFBM9MUe7HcxI4rF7LLkqCrz06G19K/SXk48jiJ8ZGrY9QOe+6KVGas3ih8xJb386SdNJEOj8wjHg9uf5S0BjQWHxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UixKbmTt4tIlcNqLLBoF02a8o5Ay01KoJUQxHgbS96k=;
 b=pIyOLCCwQp7eaGJmdc3cFtzys/lb6W2la/lIYfz7ryeySV2SnHKZjkKQy0DIWFUEjWfKE1Es1JrHBWi986JmE2UC6J/xionNXRJgeY/qDWruD3vso3H9rZ4JMlfAMtVG4Fm1xE7LHSTJPEWSlzyOB8bArNV2iF4wBEGJ3IGz5+4=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
 BYAPR04MB5143.namprd04.prod.outlook.com (52.135.234.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Thu, 16 Jan 2020 00:50:10 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::cd8e:d1de:e661:a61]) by BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::cd8e:d1de:e661:a61%5]) with mapi id 15.20.2644.015; Thu, 16 Jan 2020
 00:50:10 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     linux-next <linux-next@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: New zonefs file system
Thread-Topic: New zonefs file system
Thread-Index: AQHVy/qP0jSTCbNONECcOGID/azbRg==
Date:   Thu, 16 Jan 2020 00:50:10 +0000
Message-ID: <BYAPR04MB58161555DB2698217041718CE7360@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <BYAPR04MB5816E1F6B9479874B6B78A37E7370@BYAPR04MB5816.namprd04.prod.outlook.com>
 <20200116114441.5e8a899b@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [129.253.180.115]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fecd4c1d-f07a-41de-2322-08d79a1e09f8
x-ms-traffictypediagnostic: BYAPR04MB5143:
x-microsoft-antispam-prvs: <BYAPR04MB51438823BCC8EA4EDABD9C13E7360@BYAPR04MB5143.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(189003)(199004)(6916009)(33656002)(91956017)(54906003)(316002)(26005)(64756008)(66556008)(2906002)(6506007)(66946007)(7696005)(66446008)(66476007)(76116006)(81166006)(8936002)(8676002)(81156014)(55016002)(478600001)(3480700007)(9686003)(86362001)(71200400001)(186003)(53546011)(52536014)(4326008)(5660300002);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR04MB5143;H:BYAPR04MB5816.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ywk/auDnEmVVOCoMBRzbCJe80dWuGrpBojSkzmbY7kiv26zy3Qr4Hk0JbIAxX8nkVlhVvPZ1JqNQGhePuNyqlJH5MKjDW59XPnhZQpD1KEK3moa/1kvuZPLSQpBkDhpTWtIq0NsvnFM5mSLmSxD/79MghemKZYCLgCmjVRFhJ9/wZ+RuhSCiYlX4KBch0MLRKZRUutJOydIXs/uPSG6WExZREd5DUGNKugdbbalI0gPvNeddY22YQY4+2/zTkCAD4gJ3yi9C0LXHmMMLkkdq7rygiYH5BRfUWzMkBN+H6lfSWyiCvDTjIZ6yMNfPIRqnGpaH0j7kFU+ONGtnXmF+ImKx2Qx8ONzM0ZMKAZPNjmYHCe9VrTD6HLv2m9Dp2BOiVJhh85cakWHSRD2qp1SlFyW0O05grojS5eeKxJKgMkhXfGaXw61eajhhqIcv3KJb
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fecd4c1d-f07a-41de-2322-08d79a1e09f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 00:50:10.1318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fiVdrakadeI0nvRixj9tMJKhw/ApoQBZU7CpBb/zTkSNAGvKzue+nYoTF03dREygK39ckBEHBlr3CHaNhnzbJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5143
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2020/01/16 9:44, Stephen Rothwell wrote:=0A=
> Hi Damien,=0A=
> =0A=
> On Wed, 15 Jan 2020 23:21:49 +0000 Damien Le Moal <Damien.LeMoal@wdc.com>=
 wrote:=0A=
>>=0A=
>> Would it be possible to have zonefs being picked-up for inclusion with=
=0A=
>> linux-next ? This is per Linus instructions as a condition for getting=
=0A=
>> zonefs initial pull request accepted. The code is now in good shape and=
=0A=
>> reviewed by several people.=0A=
>>=0A=
>> The tree is here:=0A=
>>=0A=
>> git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/zonefs.git=0A=
>>=0A=
>> I prepared a for-next branch based off rc5.=0A=
>>=0A=
>> Please let me know if there are additional things I need to do for=0A=
>> getting zonefs into linux-next, e.g. tags ?=0A=
> =0A=
> I will add it from today.  It all looks good to me.=0A=
=0A=
Thanks !=0A=
=0A=
> =0A=
> Thanks for adding your subsystem tree as a participant of linux-next.  As=
=0A=
> you may know, this is not a judgement of your code.  The purpose of=0A=
> linux-next is for integration testing and to lower the impact of=0A=
> conflicts between subsystems in the next merge window. =0A=
> =0A=
> You will need to ensure that the patches/commits in your tree/series have=
=0A=
> been:=0A=
>      * submitted under GPL v2 (or later) and include the Contributor's=0A=
>         Signed-off-by,=0A=
>      * posted to the relevant mailing list,=0A=
>      * reviewed by you (or another maintainer of your subsystem tree),=0A=
>      * successfully unit tested, and =0A=
>      * destined for the current or next Linux merge window.=0A=
> =0A=
> Basically, this should be just what you would send to Linus (or ask him=
=0A=
> to fetch).  It is allowed to be rebased if you deem it necessary.=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
