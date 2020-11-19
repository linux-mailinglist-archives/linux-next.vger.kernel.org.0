Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F07E22B9A1C
	for <lists+linux-next@lfdr.de>; Thu, 19 Nov 2020 18:56:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729423AbgKSRxw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Thu, 19 Nov 2020 12:53:52 -0500
Received: from mga17.intel.com ([192.55.52.151]:64365 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727535AbgKSRxv (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Nov 2020 12:53:51 -0500
IronPort-SDR: btkbCkH8b6aKYrEPUzP+zWiDE8duK9MBdTtV90vPnrEBERtJELo+Axs/zFBkcpO84+fLvITvid
 w9pHXY+3g8cA==
X-IronPort-AV: E=McAfee;i="6000,8403,9810"; a="151180995"
X-IronPort-AV: E=Sophos;i="5.78,354,1599548400"; 
   d="scan'208";a="151180995"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2020 09:53:38 -0800
IronPort-SDR: kuBrmj3Emw5SL/nwTZszHOH/UC4ToC/fEvfBVgDAeUCOsNMnEb5zEbj0MGjNqHP9PTYh8OPhW8
 N4Rb1rbXu1Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,353,1599548400"; 
   d="scan'208";a="368940085"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga007.jf.intel.com with ESMTP; 19 Nov 2020 09:53:38 -0800
Received: from shsmsx605.ccr.corp.intel.com (10.109.6.215) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 19 Nov 2020 09:53:37 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 SHSMSX605.ccr.corp.intel.com (10.109.6.215) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 20 Nov 2020 01:53:34 +0800
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.1713.004;
 Thu, 19 Nov 2020 09:53:33 -0800
From:   "Luck, Tony" <tony.luck@intel.com>
To:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Zhuo, Qiuxu" <qiuxu.zhuo@intel.com>,
        Nicholas Piggin <npiggin@gmail.com>
Subject: RE: linux-next: Tree for Nov 19 (drivers/edac/igen6_edac.c)
Thread-Topic: linux-next: Tree for Nov 19 (drivers/edac/igen6_edac.c)
Thread-Index: AQHWvpP6tFIyQC3x9Uaq/hhnP8oH8qnPt5Wg
Date:   Thu, 19 Nov 2020 17:53:33 +0000
Message-ID: <0ad9aeffcd5342f59bae6fe64218d011@intel.com>
References: <20201119170832.614bf46d@canb.auug.org.au>
 <6d36cd23-2647-f3b1-5f55-1e00105698eb@infradead.org>
In-Reply-To: <6d36cd23-2647-f3b1-5f55-1e00105698eb@infradead.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

> ../drivers/edac/igen6_edac.c: In function 'ecclog_nmi_handler':
> ../drivers/edac/igen6_edac.c:525:10: error: 'NMI_DONE' undeclared (first use in this function); did you mean 'DMI_NONE'?
>    return NMI_DONE;

This driver has a #include <linux/nmi.h>

But inside that file it says:

#if defined(CONFIG_HAVE_NMI_WATCHDOG)
#include <asm/nmi.h>
#endif

and the randconfig used doesn't set CONFIG_HAVE_NMI_WATCHDOG


Some options:

1) Drop that #ifdef from <linux/nmi.h>
It was introduced as part of this commit:
f2e0cff85ed1 ("kernel/watchdog: introduce arch_touch_nmi_watchdog()")
presumably for some good reason.

2) Make this edac driver select CONFIG_HAVE_NMI_WATCHDOG
Yuck!

3) Make this driver #include <asm/nmi.h> instead of <linux/nmi.h>
This fixes this build error, but I thought that general policy was to
use the <linux/*.h> if it exists rather than the <asm/*.h> one.
Maybe that's ok here because this is an x86 specific driver?

I'm leaning toward option #3.

-Tony
