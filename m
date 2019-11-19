Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D56DC10117B
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 03:57:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbfKSC51 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Nov 2019 21:57:27 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:42440 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbfKSC51 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Nov 2019 21:57:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1574132246; x=1605668246;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=aHUJ1rMsjh5AhkSH8F1Cjxa9z3Db8s8q5zvDKyHZNJQ=;
  b=QR0Pc1nJ4PV8fa8LUP+dgp+Oquz9cvOqZqPnjj5uJeNs2ZDLros7o5Oh
   99cQOjcSf5AVH7nUssfKxAWWyQUS/E9ERSazU5y3dYQf40q1FoRDE7S0B
   EdVTKKlw2Gvyz8JV7NShYVptUMp13bOsmnme5wYr+i+spWPhaYENAB7yM
   8aXzurq20FV/nXy0/OlSeMOSMVq/F3OQ2jeEwynbcl8NC9LDMfUu7eoxk
   Y7FtMKL/r68A6gKL4KpvUMOv0meqWUrYKxBdXmNeftWrGN/GjGcrAWAuv
   hyjEu2AaZHYoJ+ZtKbN/XMo7hfh2Q0a90Iy9oD8WbmbMwCavBD/OxvlxK
   A==;
IronPort-SDR: qG4dUHw5kChhF/rxoRXycWSffGDUiDkNkPv5uCRbU8WHgFUWliw7Jfby82kFz1HSIyP7TGzCPD
 cnU3so5mbnCh8VT8tlukYp6FCuAel8JgxIiLdhFPMeuD6M83m1CEmFptDr/XhQmR2MevOd5ft2
 UeQCF3IZAi6/TBlw5kfO1bWvm9enuzG0VTcY78ITzbLqQoMjr/1iBS/ACjQJjhdjPNC/fS67nz
 UvOzKz7MMuBrG9lHPrb+QSIHsoFtKAqmK+qiq/sG7INjs+1Uh+8HOG+C7eIKDYmmHszGAm7BkO
 PmU=
X-IronPort-AV: E=Sophos;i="5.68,322,1569254400"; 
   d="scan'208";a="124157985"
Received: from mail-co1nam05lp2053.outbound.protection.outlook.com (HELO NAM05-CO1-obe.outbound.protection.outlook.com) ([104.47.48.53])
  by ob1.hgst.iphmx.com with ESMTP; 19 Nov 2019 10:57:24 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8IBSluZrFLiviiqMg4d772SaaWzyWlXXzh/vHyA/pZSIIbFEr+IyB6/FxoUuehrQY9V4aR9kcgW/LsmPGYRezWq7c+9rlynRBFPPlNng5VqvEhuTvVwp//3rseijE5IWhOi5ndNIhDhJ5833huPTC5r0glcs6hdnwQJucWyFXsVxdOSdmYkEYzsyZxxGPqJzjl4bW0RM2rT/T26+Ep6j2XrWODgX3xlpCbkxkZUKIPp7vZU54hzvD1ud7ednXFJtEePsCH69N2H2Kt8r1gJK+szneXo2nH676pbwfSMyAhrt2asDguUCRvYk+/BMrBUeih6sf3Xn1r5IBbzyKxLZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27Bd6Eat/+0FXeGT2bKOE21dSTrg95XmSdPW9TPmKPc=;
 b=VajXvuf7LGs/7Jwn23uakuZ2/lQxR7eBOz27WqLFjP+EUiAYg3tl7aPxVkR8bQ0QW3XcDQmtMH0wphPAkFJdkEeoOtZ3pnsAoYDLUSuSZOAv4rHj0V8W6OQsDnZirWwycZrPhFfy0ZBwOPzW0ayTz1lk/ggvfmASrT4EApHWoO78b6CQFJKktg8ziRxmnxdw3jCM5+admepmOB4xvwIeIWMDZuTyWyASYfhjROsCx9m+Nb9GsftVLvpHOk7VzWWaS20PebE5C9pZKSTRfk+7K1la4G0FIvGgIXz0ZMiw20P/crfDTogWTRvmjoE1OLTR9jLAKUZY0RCmQDnMEhtwEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27Bd6Eat/+0FXeGT2bKOE21dSTrg95XmSdPW9TPmKPc=;
 b=dTV1xSxmjgtLscT42KfDPrNg6cHraaC2MPYpJl30s0DQfeb8Xqvtq+WikoSpYsfkLA1qAuYCptcI7Z+c4/5oI9ZbF25WXyXo1AAzm+sbMYi2eBfuX1F7crgp1Ss2+NXBk8GYY2Yc+GjvLmj1O+m3PA08DgEWfzfQZA7QCxGTZog=
Received: from BYAPR04MB5816.namprd04.prod.outlook.com (20.179.59.16) by
 BYAPR04MB5303.namprd04.prod.outlook.com (20.178.48.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.30; Tue, 19 Nov 2019 02:57:23 +0000
Received: from BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::4176:5eda:76a2:3c40]) by BYAPR04MB5816.namprd04.prod.outlook.com
 ([fe80::4176:5eda:76a2:3c40%7]) with mapi id 15.20.2451.031; Tue, 19 Nov 2019
 02:57:23 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Kees Cook <keescook@chromium.org>, Jens Axboe <axboe@kernel.dk>
CC:     Christoph Hellwig <hch@lst.de>, Hannes Reinecke <hare@suse.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Subject: Re: Coverity: blkdev_zone_mgmt(): Memory - illegal accesses
Thread-Topic: Coverity: blkdev_zone_mgmt(): Memory - illegal accesses
Thread-Index: AQHVmPlreELBLhdk3EmMUOecE6Gv/A==
Date:   Tue, 19 Nov 2019 02:57:22 +0000
Message-ID: <BYAPR04MB58160379E2BB1352F1BB7197E74C0@BYAPR04MB5816.namprd04.prod.outlook.com>
References: <201911111735.3EA3258CBC@keescook>
 <201911181233.A2AB6617E@keescook>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Damien.LeMoal@wdc.com; 
x-originating-ip: [199.255.47.8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 562e861f-a4e5-47a5-eb61-08d76c9c3378
x-ms-traffictypediagnostic: BYAPR04MB5303:
x-microsoft-antispam-prvs: <BYAPR04MB5303FFC3F17EA2B97C778C55E74C0@BYAPR04MB5303.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(376002)(39860400002)(136003)(366004)(396003)(189003)(199004)(305945005)(81156014)(446003)(6306002)(110136005)(476003)(486006)(55016002)(64756008)(66446008)(66476007)(66946007)(8936002)(186003)(76116006)(91956017)(3846002)(26005)(966005)(86362001)(7696005)(76176011)(53546011)(6506007)(2906002)(102836004)(4326008)(6116002)(316002)(5660300002)(6246003)(54906003)(229853002)(99286004)(74316002)(7736002)(14454004)(71190400001)(71200400001)(66556008)(478600001)(8676002)(6436002)(25786009)(52536014)(9686003)(256004)(14444005)(66066001)(33656002)(81166006);DIR:OUT;SFP:1102;SCL:1;SRVR:BYAPR04MB5303;H:BYAPR04MB5816.namprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ng96vE/CnvnIjlT2GbPi6lRZ5wZ93mj+6mCLeYYSd4zUGNLW+guqIcL8EQpegtxdGwTeI+VxwlAuGvvT1PL0mj+cOT7InGrVlM2oOiJRt5Mv2mqvO2uq1qcdiiqWGEnG7sHLba9Ca+Y/Ij3meK6hs0UdMc6kwCAwYAoCTPP7EQ3X9M0cB5KLFmjEN1nLV1H6hdWZGpbxQpLf8VCg/cYJKQ2MPP2XAjFTK/n/m1Yzn9ryvATSBYXqt1NOtZ8RpuM4hSU1VE/dGeESpXUXLg1NhC2wP/VJvZzOZOiGlx8gv4kkvlT99LlBSK8LeZfPAeryyB1UiSRdHXYm8SZn7pDzJgsDbfRIKz4s0fDY8n77rkCH9AN6hbq+mcjdHE/JDCMkQtoIseN1UH/aCwYlY2D69IxPlmrFyOpYVB7Nn+0B3hzHk9Nz9w7YAtpnklFWcbrf
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562e861f-a4e5-47a5-eb61-08d76c9c3378
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 02:57:22.7406
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7wRyVV0XFJmW1UVUCVUR7ur+6H41Fe7a9QtDkNvyBnzvHymxCmSXwccasy/jMb402dI7XQCcDYU1sri2T/kN2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5303
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2019/11/19 5:46, Kees Cook wrote:=0A=
> On Mon, Nov 11, 2019 at 05:35:00PM -0800, coverity-bot wrote:=0A=
>> Hello!=0A=
>>=0A=
>> This is an experimental automated report about issues detected by Coveri=
ty=0A=
>> from a scan of next-20191108 as part of the linux-next weekly scan proje=
ct:=0A=
>> https://scan.coverity.com/projects/linux-next-weekly-scan=0A=
>>=0A=
>> You're getting this email because you were associated with the identifie=
d=0A=
>> lines of code (noted below) that were touched by recent commits:=0A=
>>=0A=
>> a2d6b3a2d390 ("block: Improve zone reset execution")=0A=
>>=0A=
>> Coverity reported the following:=0A=
>>=0A=
>> *** CID 1487849:  Memory - illegal accesses  (USE_AFTER_FREE)=0A=
>> /block/blk-zoned.c: 293 in blkdev_zone_mgmt()=0A=
>> 287=0A=
>> 288     		/* This may take a while, so be nice to others */=0A=
>> 289     		cond_resched();=0A=
>> 290     	}=0A=
>> 291=0A=
>> 292     	ret =3D submit_bio_wait(bio);=0A=
>> vvv     CID 1487849:  Memory - illegal accesses  (USE_AFTER_FREE)=0A=
>> vvv     Calling "bio_put" dereferences freed pointer "bio".=0A=
>> 293     	bio_put(bio);=0A=
> =0A=
> I don't know this area of the code very well, but looking through the=0A=
> helpers here, it does seem like "bio" gets (or can be) freed before=0A=
> returning from submit_bio_wait() (regardless to what the comment=0A=
> says):=0A=
> =0A=
> submit_bio_wait()=0A=
>   submit_bio()=0A=
>     generic_make_request()=0A=
>       generic_make_request_check()=0A=
>         bio_endio()=0A=
>           __bio_chain_endio()=0A=
>             bio_put()=0A=
> =0A=
> The path passes into some error handling here, but it does seem like it=
=0A=
> could be possible to hit both bio_put()s?=0A=
> =0A=
> Can anyone speak to this?=0A=
=0A=
Kees,=0A=
=0A=
This is a false positive: the end callback for a BIO submitted with=0A=
submit_bio_wait() is set to the submit_bio_wait_endio() function which=0A=
only does a complete() call for a completion on stack. There is no=0A=
bio_put() in the completion path in that case, hence the extra bio_put()=0A=
called after the submit_bio_wait().=0A=
=0A=
This is all similar to the functions blkdev_issue_discard() or=0A=
blkdev_issue_write_same() in block/blk-lib.c.=0A=
=0A=
> =0A=
> -Kees=0A=
> =0A=
>> 294=0A=
>> 295     	return ret;=0A=
>> 296     }=0A=
>> 297     EXPORT_SYMBOL_GPL(blkdev_zone_mgmt);=0A=
>> 298=0A=
>>=0A=
>> If this is a false positive, please let us know so we can mark it as=0A=
>> such, or teach the Coverity rules to be smarter. If not, please make=0A=
>> sure fixes get into linux-next. :) For patches fixing this, please=0A=
>> include these lines (but double-check the "Fixes" first):=0A=
>>=0A=
>> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>=0A=
>> Addresses-Coverity-ID: 1487849 ("Memory - illegal accesses")=0A=
>> Fixes: a2d6b3a2d390 ("block: Improve zone reset execution")=0A=
>>=0A=
>>=0A=
>> Thanks for your attention!=0A=
>>=0A=
>> -- =0A=
>> Coverity-bot=0A=
> =0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
