Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 148FB2765ED
	for <lists+linux-next@lfdr.de>; Thu, 24 Sep 2020 03:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725273AbgIXBjt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 23 Sep 2020 21:39:49 -0400
Received: from mga06.intel.com ([134.134.136.31]:64328 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725208AbgIXBjt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 23 Sep 2020 21:39:49 -0400
IronPort-SDR: c8+gKPLwYLys0IJqXdPO4AWEsGhB9qVv4MSDtBh/OMIK+iMxXH/FnZJO27MbzojAX9l7heGnzg
 cE4L9Gs3hQxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="222650143"
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; 
   d="scan'208";a="222650143"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2020 18:40:03 -0700
IronPort-SDR: n+V8z8pbDcsY79sBlUu9QnoAVDyXTGX0/OOmY3O7AiTRUrFytf+QJ552Gc3lrxRzEcbOlE/6hh
 wF+Y1g2Z/t0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; 
   d="scan'208";a="342654082"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga002.fm.intel.com with ESMTP; 23 Sep 2020 18:40:02 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 23 Sep 2020 18:40:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 23 Sep 2020 18:40:02 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 23 Sep 2020 18:39:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m7GeOPiLzBV5qsGnoxT9+1CsHO3+rIDhJt+33w7HdwtOCDkNFa8R0mHGBqrl7aGulsfog32UqA3jcv+35aFywl9LjSXKzsflmpTT2R7szR2h/NRR4hnZQNl//DrsenDxsw2/52L1jN5rg3eL8MJlbi5Pn6oNqOXlm96Uxg/69xs/04m26+zAE6m9LkFG2nQGwc/3Qqu5LOFmTr/oFPsCP3Vcg53TYM6zyIe1739Waxq3RFRP3VqVZhcYRrwayl/3NHS+U74CRffgxPhykK6eOTlQ+rFbW26uhCSZUhrXhfZiouyFaj6Js0N6SXBLC5x1fz+3y8P2owcj25/N9XPDJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5KBo9YOVySdUWz/2Jw9VFlyf0B399Z6b4vvXV+tBm0=;
 b=FZ0UY/zMXZIOeNzj58fLKSHjZn8Aog4l1atqAmd15SKMZ/NbstKI1JEXHCGAt0S52/XdS2ksEYNBVsi3iUG6pXTvlQxVaKmVKtru74RUREAMp7zC6hzSB0tXlhqNa/frgE+Y0yiASI0XMFA59bhwUURgGtG5u7UV/Ij+OikqghHibeTOpvLC1qNdznGpwZimZCFFnETDrIkrNFB1WHd8FJrZ2YQK5dXa5fyKtPgQXYcNPQDPrQ95hUXdH1uCGoXPm/cdnWUrwYUgugzDEwW93AJkveh5BdEzXIuwif00sInms4OYNMt3DZ31FmNtKJCpx1XjqQjpkT38WMRRlYawrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5KBo9YOVySdUWz/2Jw9VFlyf0B399Z6b4vvXV+tBm0=;
 b=UjSxe++uwCiQTsh/zDQlsqMyTAZL1cyKZTmcezDMTHM/IBLWy4oGhAqUI4uQmFjPuwDutIaU3IVzhoM02SG3J4GF8xUNFrbgVIorS/7fIXMwosNuC3XG9nsUp2U0Mkfc3BK32IXyqle7tkeOfdV+7pPj6XQwmqfM1eJEGMZKe24=
Received: from BN6PR11MB4132.namprd11.prod.outlook.com (2603:10b6:405:81::10)
 by BN7PR11MB2660.namprd11.prod.outlook.com (2603:10b6:406:b2::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Thu, 24 Sep
 2020 01:39:53 +0000
Received: from BN6PR11MB4132.namprd11.prod.outlook.com
 ([fe80::8189:cff:4996:ef83]) by BN6PR11MB4132.namprd11.prod.outlook.com
 ([fe80::8189:cff:4996:ef83%6]) with mapi id 15.20.3412.020; Thu, 24 Sep 2020
 01:39:53 +0000
From:   "Williams, Dan J" <dan.j.williams@intel.com>
To:     "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>,
        "miklos@szeredi.hu" <miklos@szeredi.hu>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>
CC:     "jgross@suse.com" <jgross@suse.com>,
        "bo.liu@linux.alibaba.com" <bo.liu@linux.alibaba.com>,
        "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
        "stefanha@redhat.com" <stefanha@redhat.com>,
        "roger.pau@citrix.com" <roger.pau@citrix.com>,
        "vgoyal@redhat.com" <vgoyal@redhat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "dgilbert@redhat.com" <dgilbert@redhat.com>,
        "Boeuf, Sebastien" <sebastien.boeuf@intel.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Thread-Topic: linux-next: build failure after merge of the akpm-current tree
Thread-Index: AQHWhchAS0YQ3On0Gk+1KJqoiWlynKl3G6EA
Date:   Thu, 24 Sep 2020 01:39:53 +0000
Message-ID: <23624101c03e9f60e66bac5c9739769931968c32.camel@intel.com>
References: <20200908200950.1368e71b@canb.auug.org.au>
In-Reply-To: <20200908200950.1368e71b@canb.auug.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.32.5 (3.32.5-1.fc30) 
authentication-results: canb.auug.org.au; dkim=none (message not signed)
 header.d=none;canb.auug.org.au; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.52.200]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94d36c20-6c3c-44e2-a017-08d8602abc41
x-ms-traffictypediagnostic: BN7PR11MB2660:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN7PR11MB2660F897107E0887DD88B0AEC6390@BN7PR11MB2660.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:565;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SIO81uLOlKmyWhrjI6P4j+OTvjs0quL4olf3sQ7ZIJOcVSUq/hn36mmySVns5pvtz4FvAs7s78ROKKRKj67WHR0uwRBvyhh/D+1/yGfRITbnCPe1+YmuXeMHvPl4G6W7JY5kPA3/NAhPhQOvG5n98CiYC0ja9D3CPCm3zcg8H9Ck+JgJwK0X10uFjYMSiNJ+W84YZ+qhqXQ8vkRwbBuQK8SojkYPvQ3AeyKh8kYRvf1ihJEiFwpRzKO+bueiJzCWKqepYurIi8EedeX+30cdjcAmj6EF1/TzkYjZuZQKG2IBlCILUIFC48Et+F8nYIczjb7xAGUuxgReY/lDQ3kIqN7Izi70pHmiIArIsdd0QgLfaFLS1RlUI/NjFWp510EH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB4132.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(66446008)(76116006)(66556008)(36756003)(64756008)(53546011)(91956017)(6506007)(54906003)(66476007)(66946007)(316002)(6512007)(26005)(186003)(83380400001)(2616005)(478600001)(8676002)(6486002)(2906002)(86362001)(4326008)(71200400001)(7416002)(5660300002)(8936002)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 4gTH/idYPQhSTA06KSubr/nHSwyz4PqmgGGrzOganvPjVWngHZsUdlc+P1a3bzOxp5d6n8EV4x+igSlCfema4MCVWQ52RlVDsdWxIam5fv+pbm5u/AgyXYaX3L3LZYe4BByxEyvRMJy0cIpoMMnZRpyx4T3CbfE7uTi+64Rvh9tjtR9CS6IMrU1C0TMQfJt0mBeyx2+kUtlh86sVSGq3TlTgbnwvbbsqtaXhE3mV2cxTGQBauA13HDa6eR5puAVvi23EsLMW5cgHFbRYrRzS35BAKtc8RnHD1Qf/AxkmRjClI5ZDm6YbwBFHfqe9BP89B3lvfwzic7Ugx4f6wjhVOrJ3bUVuSAzX0PHGClZcjXugWAuoGndfR0hWSbWImqL4k/DlcMxizLz+rxuAJyG5bAhYSLH/0LSpG6nbNJ6jynz4iqhmHl7apxgerwpT18GEUwq+YmL3XzRDJWJ2vu6T4Lzst8w+i6HAgTL99UQatG6wpUayjVOGPOM3RV9ZoXnSdVt43VJAk2o9nPrHElN8wOHkLXYa1oRCb+X8o11J5AHKnaGvExCvfDmccOc0/t5A9TccZ01Sk3YcRASv1gQilZSyciuoGvchhHlnVzqDqy+Mrq0l/EtHlA0zIxnvX1qZATZNSvTJsironCxsaZXt0A==
Content-Type: text/plain; charset="utf-7"
Content-ID: <5D49C08364F1354F99D909EF349F532E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB4132.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d36c20-6c3c-44e2-a017-08d8602abc41
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 01:39:53.4016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p0W0lQ8v2THy2zhdeV04h3hSJ4FVP54bPFDnuxrKvkjUTr9IvNhAqIa/ySFjwFs90u2MT5MAqHOy975WNqvBDlKcXGRh8x+1yPTHF7mNgeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2660
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 2020-09-08 at 20:09 +-1000, Stephen Rothwell wrote:
+AD4- Hi all,
+AD4-=20
+AD4- After merging the akpm-current tree, today's linux-next build (x86+AF=
8-64
+AD4- allmodconfig) failed like this:
+AD4-=20
+AD4- drivers/xen/unpopulated-alloc.c: In function 'fill+AF8-list':
+AD4- drivers/xen/unpopulated-alloc.c:30:9: error: 'struct dev+AF8-pagemap'=
 has
+AD4- no member named 'res'+ADs- did you mean 'ref'?
+AD4-    30 +AHw-  pgmap-+AD4-res.name +AD0- +ACI-Xen scratch+ACIAOw-
+AD4-       +AHw-         +AF4AfgB+-
+AD4-       +AHw-         ref
+AD4- drivers/xen/unpopulated-alloc.c:31:9: error: 'struct dev+AF8-pagemap'=
 has
+AD4- no member named 'res'+ADs- did you mean 'ref'?
+AD4-    31 +AHw-  pgmap-+AD4-res.flags +AD0- IORESOURCE+AF8-MEM +AHw- IORE=
SOURCE+AF8-BUSY+ADs-
+AD4-       +AHw-         +AF4AfgB+-
+AD4-       +AHw-         ref
+AD4- drivers/xen/unpopulated-alloc.c:33:51: error: 'struct dev+AF8-pagemap=
'
+AD4- has no member named 'res'+ADs- did you mean 'ref'?
+AD4-    33 +AHw-  ret +AD0- allocate+AF8-resource(+ACY-iomem+AF8-resource,=
 +ACY-pgmap-+AD4-res,
+AD4-       +AHw-                                                   +AF4Afg=
B+-
+AD4-       +AHw-                                                   ref
+AD4- In file included from include/asm-generic/memory+AF8-model.h:5,
+AD4-                  from arch/x86/include/asm/page.h:76,
+AD4-                  from arch/x86/include/asm/thread+AF8-info.h:12,
+AD4-                  from include/linux/thread+AF8-info.h:38,
+AD4-                  from arch/x86/include/asm/preempt.h:7,
+AD4-                  from include/linux/preempt.h:78,
+AD4-                  from include/linux/spinlock.h:51,
+AD4-                  from include/linux/mmzone.h:8,
+AD4-                  from include/linux/gfp.h:6,
+AD4-                  from drivers/xen/unpopulated-alloc.c:3:
+AD4- drivers/xen/unpopulated-alloc.c:53:35: error: 'struct dev+AF8-pagemap=
'
+AD4- has no member named 'res'+ADs- did you mean 'ref'?
+AD4-    53 +AHw-   xen+AF8-pfn+AF8-t pfn +AD0- PFN+AF8-DOWN(pgmap-+AD4-res=
.start)+ADs-
+AD4-       +AHw-                                   +AF4AfgB+-
+AD4- include/linux/pfn.h:20:23: note: in definition of macro 'PFN+AF8-DOWN=
'
+AD4-    20 +AHw- +ACM-define PFN+AF8-DOWN(x) ((x) +AD4APg- PAGE+AF8-SHIFT)
+AD4-       +AHw-                       +AF4-
+AD4- drivers/xen/unpopulated-alloc.c:58:30: error: 'struct dev+AF8-pagemap=
'
+AD4- has no member named 'res'+ADs- did you mean 'ref'?
+AD4-    58 +AHw-     release+AF8-resource(+ACY-pgmap-+AD4-res)+ADs-
+AD4-       +AHw-                              +AF4AfgB+-
+AD4-       +AHw-                              ref
+AD4- drivers/xen/unpopulated-alloc.c:69:28: error: 'struct dev+AF8-pagemap=
'
+AD4- has no member named 'res'+ADs- did you mean 'ref'?
+AD4-    69 +AHw-   release+AF8-resource(+ACY-pgmap-+AD4-res)+ADs-
+AD4-       +AHw-                            +AF4AfgB+-
+AD4-       +AHw-                            ref
+AD4- fs/fuse/virtio+AF8-fs.c: In function 'virtio+AF8-fs+AF8-setup+AF8-dax=
':
+AD4- fs/fuse/virtio+AF8-fs.c:838:9: error: 'struct dev+AF8-pagemap' has no=
 member
+AD4- named 'res'+ADs- did you mean 'ref'?
+AD4-   838 +AHw-  pgmap-+AD4-res +AD0- (struct resource)+AHs-
+AD4-       +AHw-         +AF4AfgB+-
+AD4-       +AHw-         ref
+AD4-=20
+AD4- Caused by commit
+AD4-=20
+AD4-   b3e022c5a68c (+ACI-mm/memremap+AF8-pages: convert to 'struct range'=
+ACI-)
+AD4-=20
+AD4- interacting with commit
+AD4-=20
+AD4-   9e2369c06c8a (+ACI-xen: add helpers to allocate unpopulated memory+=
ACI-)
+AD4-=20
+AD4- from Linus' tree (in v5.9-rc4) and commit
+AD4-=20
+AD4-   7e833303db20 (+ACI-virtiofs: set up virtio+AF8-fs dax+AF8-device+AC=
I-)
+AD4-=20
+AD4- from the fuse tree.
+AD4-=20
+AD4- I have added the following patch which may require more work but at
+AD4- least makes it all build.
+AD4-=20
+AD4- From: Stephen Rothwell +ADw-sfr+AEA-canb.auug.org.au+AD4-
+AD4- Date: Tue, 8 Sep 2020 20:00:20 +-1000
+AD4- Subject: +AFs-PATCH+AF0- merge fix up for +ACI-mm/memremap+AF8-pages:=
 convert to
+AD4- 'struct
+AD4-  range'+ACI-
+AD4-=20
+AD4- Signed-off-by: Stephen Rothwell +ADw-sfr+AEA-canb.auug.org.au+AD4-
+AD4- ---
+AD4-  drivers/xen/unpopulated-alloc.c +AHw- 15 +-+-+-+-+-+-+-+-+-------
+AD4-  fs/fuse/virtio+AF8-fs.c             +AHw-  3 +---
+AD4-  2 files changed, 10 insertions(+-), 8 deletions(-)
+AD4-=20
+AD4- diff --git a/drivers/xen/unpopulated-alloc.c
+AD4- b/drivers/xen/unpopulated-alloc.c
+AD4- index 3b98dc921426..9fa7ce330628 100644
+AD4- --- a/drivers/xen/unpopulated-alloc.c
+AD4- +-+-+- b/drivers/xen/unpopulated-alloc.c
+AD4- +AEAAQA- -18,6 +-18,7 +AEAAQA- static unsigned int list+AF8-count+ADs=
-
+AD4-  static int fill+AF8-list(unsigned int nr+AF8-pages)
+AD4-  +AHs-
+AD4-  	struct dev+AF8-pagemap +ACo-pgmap+ADs-
+AD4- +-	struct resource res+ADs-
+AD4-  	void +ACo-vaddr+ADs-
+AD4-  	unsigned int i, alloc+AF8-pages +AD0- round+AF8-up(nr+AF8-pages,
+AD4- PAGES+AF8-PER+AF8-SECTION)+ADs-
+AD4-  	int ret+ADs-
+AD4- +AEAAQA- -27,10 +-28,10 +AEAAQA- static int fill+AF8-list(unsigned in=
t nr+AF8-pages)
+AD4-  		return -ENOMEM+ADs-
+AD4- =20
+AD4-  	pgmap-+AD4-type +AD0- MEMORY+AF8-DEVICE+AF8-GENERIC+ADs-
+AD4- -	pgmap-+AD4-res.name +AD0- +ACI-Xen scratch+ACIAOw-
+AD4- -	pgmap-+AD4-res.flags +AD0- IORESOURCE+AF8-MEM +AHw- IORESOURCE+AF8-=
BUSY+ADs-

This is broken... it needs to be converted to 'struct range'. I'll take
care of that when I respin the series. Sorry for the thrash it seems
this is a new memremap+AF8-pages() user since the conversion patches
landed.

