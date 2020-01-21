Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1049D14376C
	for <lists+linux-next@lfdr.de>; Tue, 21 Jan 2020 08:13:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725890AbgAUHNj convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Tue, 21 Jan 2020 02:13:39 -0500
Received: from mga02.intel.com ([134.134.136.20]:1221 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725789AbgAUHNj (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Jan 2020 02:13:39 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jan 2020 23:13:38 -0800
X-IronPort-AV: E=Sophos;i="5.70,345,1574150400"; 
   d="scan'208";a="219856969"
Received: from joloughl-mobl.ger.corp.intel.com (HELO localhost) ([10.252.11.51])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 20 Jan 2020 23:13:35 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200121083424.66d98dc5@canb.auug.org.au>
References: <20200121083424.66d98dc5@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the drm-intel-fixes tree
From:   Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Matthew Auld <matthew.auld@intel.com>
To:     DRI <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date:   Tue, 21 Jan 2020 09:13:24 +0200
Message-ID: <157959080456.6877.8085345204229334781@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.8.1
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Quoting Stephen Rothwell (2020-01-20 23:34:24)
> Hi all,
> 
> After merging the drm-intel-fixes tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> 
> Caused by commit
> 
>   d8fcca47e195 ("drm/i915/userptr: fix size calculation")
> 
> I have reverted that commit for today.

It was a missing git add while fixing a cherry-pick and is now fixed.

Regards, Joonas
