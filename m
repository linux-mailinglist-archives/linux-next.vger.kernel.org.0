Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EE6613D0A1
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 00:21:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729354AbgAOXVx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 15 Jan 2020 18:21:53 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:51967 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgAOXVx (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 15 Jan 2020 18:21:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1579130512; x=1610666512;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=5XsaoB5Ip/J/QiJD+IDQUHTRrFFo3fasmfeVdblSDaQ=;
  b=azdvfZT7pz3E+kLsPyA9LGDofeH7cYxa6M5YC4bbSCRmYOqsf9p0vYwq
   ciTkBYY5OqsD2IB/0ay3rAOszc3CKfzrFv661TNHyQMNDmtf0B/I9GzxR
   NmHpK/WQQSW1M45Gw1MveI1XDvX5z7CRNvvutds8hjFs7BJWj/KCvLgvB
   4a9b6MWNshcpGHQOdg2jOt6Hxy4Rlz23sV6i2ua93uBZtVwUIMSW1CAv+
   hWRlNW7SUlPNRUUjRfh4wecRe/6Pc/G7I04bkB5Hkyi4wP88cUutpjXnU
   QaBJAMd+XCz9fbqcwvR4OluOsKld4lW7bVX7SvJ1QjTmokFKb6f2UAZtU
   Q==;
IronPort-SDR: 5baPW3NFPRymdSGR1GaiDM182GJTtxkCg3vNw0nCP7OSO2gfABhLaUQS2i3NHnRkOf2WetnfEb
 XGlbVtwyFdNmPaWg/6b5CuhbdYLGzBsN9oEIXdqJUOCnRQ8J7OXbqQ+vhLuetFMZOLPo9s6bQs
 b7W2++FEr2CfJUKE/OZgv3Z5OrwtHFR4hx1wF2QDVr8oetDBiAyW8DTzvGNoyGXJwGv+TAtU2L
 +7Ygn6UCL7oZLWlRw+3Ps1gGD2f9rX46jhX+5DaKbooOWzBj64AxRzSStVD29VPHIWtx8K+Elu
 DgE=
X-IronPort-AV: E=Sophos;i="5.70,323,1574092800"; 
   d="scan'208";a="128280664"
Received: from mail-bn7nam10lp2104.outbound.protection.outlook.com (HELO NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.104])
  by ob1.hgst.iphmx.com with ESMTP; 16 Jan 2020 07:21:51 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Psr5THv5OkdOq/y8j7CjQwf2ptNqrf/WKlAtcfiofgZI0qE1BuOTkg4Jc3YYVJW3MJXAErwwERI/wFZ0fLaGMC4+G7oK8u1i7jYyEgzPD1+vCw41K+s/var2AO971FlAlBtbdUszxfL78Gjk9uOtOpQpNZUd3UMwHtq68XpadyjX8QBw2Gr3pZS7AujgvnSsGCzB4UHI9WJTiW1k0HjlGWGS+a5GlS+wI0gjcIs+ec6SSCEgACeLPeTgO5eeg8OgIalukCqKDY6yThJZz/v4rQVGeNv6Pq/lkQ1ntG6ukkUjCAr/9aJAkKw5FY8oC55/n8tCA1budUpQA+PZqT/qNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XsaoB5Ip/J/QiJD+IDQUHTRrFFo3fasmfeVdblSDaQ=;
 b=lZymbARkJlK0TAWFjnOIPf2TdqV/R7QgZecYabho3Rfx2Jw+PcQBMDJhOhxh5JRgJpoEORsAYbo39SVgAexMqFR8bGna7nB3YfgIz0AN0u9QjQ9ycS5DdYGkK2uXdJvWGMwyXwD5e/uNfBpmHd+aE6Fi0uP9D1BnxcsavBw+XJ0Ui8PvW/hyKqdX7z0V8bBJLPJgOMylu1dm2Rp+30z3TK17W1X+8jfckAaMI/FBSaGDwNZQDeDDLnOVXvv48RGTG1wsUWdVnb6roKmJ5gDjWkxyWh0zRLdMI/6YhPshSixEdIlIuA5CWbrf857r+YSI2Y1Xu3TS39ihYBOCSg8K/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XsaoB5Ip/J/QiJD+IDQUHTRrFFo3fasmfeVdblSDaQ=;
 b=T77pKkk0cS9Pic7s0xuQO2MIJLf6vAgbyoMTQ1nkrRsaGUqQqD7sAWxiJeZX+3V9lPXymfZij+XSotW1Nj3uymkO/TBOek1XZVRnw9ofB8iIT/4S7L0c+6L4An5qeMeG7glr3M8/wyJdYoln17vC8DmtlHpPx+q1zmuxMIJda/U=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
 BYAPR04MB5142.namprd04.prod.outlook.com (52.135.235.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Wed, 15 Jan 2020 23:21:49 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::cd8e:d1de:e661:a61]) by BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::cd8e:d1de:e661:a61%5]) with mapi id 15.20.2644.015; Wed, 15 Jan 2020
 23:21:49 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next <linux-next@vger.kernel.org>
CC:     Linus Torvalds <torvalds@linux-foundation.org>
Subject: New zonefs file system
Thread-Topic: New zonefs file system
Thread-Index: AQHVy/qP0jSTCbNONECcOGID/azbRg==
Date:   Wed, 15 Jan 2020 23:21:49 +0000
Message-ID: <BYAPR04MB5816E1F6B9479874B6B78A37E7370@BYAPR04MB5816.namprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [59.100.149.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1cad2500-4132-416f-0d22-08d79a11b2b5
x-ms-traffictypediagnostic: BYAPR04MB5142:
x-microsoft-antispam-prvs: <BYAPR04MB514204E70A282E40039CD7CCE7370@BYAPR04MB5142.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(199004)(189003)(26005)(4744005)(9686003)(186003)(66946007)(64756008)(66556008)(8676002)(33656002)(66476007)(7696005)(6506007)(5660300002)(2906002)(52536014)(8936002)(91956017)(4326008)(3480700007)(316002)(110136005)(478600001)(55016002)(66446008)(76116006)(71200400001)(86362001)(81156014)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR04MB5142;H:BYAPR04MB5816.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lGUHPnnEBia0ZYgNg+wnWTzY+PpCDcCugBm8nRTq9lHVsGmAB/M/dgbltyrLbEMH0IH5B9ZXwrBBsfxMFzwit7f6hz6A9JlyiYx7o0CXiy6fFIBxMLd+7JCAnk91WoZ/93j9mUIm52rVXZFovumbRdYH/88RJ7AelMJ+2q1ZdXkvsvYycJk3p+WP456BKkbn48BBSqGwC4FOPqIN494PSyp3Q7OjTVrvFNsm93VjzqYa0Md2w0dp/rI+YDrdAR306mJqVmag5VwvmhvpJBllCHQ/R6rrlxUpupfa9fif8Dea+5gyh1CZLgePz4sOPLOcn7zEsuDg55GtDU3baKKAmXaGC/Kx60ojvJ+LAyKg1NaCEVm2RKFfz5jhPSlKcls1w4PRetRvg6Sy5Na2FLIjIjaEfS+opEkSIQx4KyvgVEI4g/IILDYQ/ERh4Sp6LJxV
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cad2500-4132-416f-0d22-08d79a11b2b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 23:21:49.8626
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JYW6lPFHWaokA2SnyuQzGbD3b8+hVfq8bKDx25b8ltBX0/fMPJ90S7m/38Mqs82b2VXMO6qPGOLXWw76q0wMfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5142
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,=0A=
=0A=
Would it be possible to have zonefs being picked-up for inclusion with=0A=
linux-next ? This is per Linus instructions as a condition for getting=0A=
zonefs initial pull request accepted. The code is now in good shape and=0A=
reviewed by several people.=0A=
=0A=
The tree is here:=0A=
=0A=
git://git.kernel.org/pub/scm/linux/kernel/git/dlemoal/zonefs.git=0A=
=0A=
I prepared a for-next branch based off rc5.=0A=
=0A=
Please let me know if there are additional things I need to do for=0A=
getting zonefs into linux-next, e.g. tags ?=0A=
=0A=
Best regards.=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
