Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E55E4307FCA
	for <lists+linux-next@lfdr.de>; Thu, 28 Jan 2021 21:41:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhA1Ujr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Thu, 28 Jan 2021 15:39:47 -0500
Received: from mga12.intel.com ([192.55.52.136]:15177 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229831AbhA1Ujq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 Jan 2021 15:39:46 -0500
IronPort-SDR: carf5NRYFQYEVCuNUFcVV8MLmj0xrdGRFHBBvY9FDmUu0SygaOeo3YF+jva7hfU257XtEpkCKv
 zy7b/PhlICEQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9878"; a="159482356"
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; 
   d="scan'208";a="159482356"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2021 12:38:59 -0800
IronPort-SDR: AN5IBw3CGhrbXQIiJONhVKfE6RhYzSuYkMGfX4kV1hMTF88xP6YqityZNgJZMIMqP3Be3CLRPi
 sIIZ8hvN/IAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,383,1602572400"; 
   d="scan'208";a="354315727"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga003.jf.intel.com with ESMTP; 28 Jan 2021 12:38:56 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 28 Jan 2021 12:38:55 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 28 Jan 2021 12:38:55 -0800
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2106.002;
 Thu, 28 Jan 2021 12:38:55 -0800
From:   "Luck, Tony" <tony.luck@intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: RE: linux-next: removal of the ia64 tree
Thread-Topic: linux-next: removal of the ia64 tree
Thread-Index: AQHW9a8nWF9ZnaJl5EOokyd9Zq820qo9f4/A
Date:   Thu, 28 Jan 2021 20:38:54 +0000
Message-ID: <9e4eadad78f644a5ba22b2c11bee91ad@intel.com>
References: <20210129065237.39b2bea3@canb.auug.org.au>
In-Reply-To: <20210129065237.39b2bea3@canb.auug.org.au>
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

Stephen,

Yes. Most stuff I do these days goes through the RAS tree I share with Boris.

-Tony

-----Original Message-----
From: Stephen Rothwell <sfr@canb.auug.org.au> 
Sent: Thursday, January 28, 2021 11:53 AM
To: Luck, Tony <tony.luck@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>; Linux Kernel Mailing List <linux-kernel@vger.kernel.org>; Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: removal of the ia64 tree

Hi Tony,

I noticed commit

  96ec72a3425d ("ia64: Mark architecture as orphaned")

just went into Linus' tree, so I assume I should drop the ia64 tree
from linux-next?

-- 
Cheers,
Stephen Rothwell
