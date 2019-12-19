Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5779126241
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2019 13:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726694AbfLSMhI (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Dec 2019 07:37:08 -0500
Received: from mga14.intel.com ([192.55.52.115]:33372 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726699AbfLSMhI (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Dec 2019 07:37:08 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Dec 2019 04:37:08 -0800
X-IronPort-AV: E=Sophos;i="5.69,331,1571727600"; 
   d="scan'208";a="206193204"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Dec 2019 04:37:05 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        DRI <dri-devel@lists.freedesktop.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commits in the drm-intel-fixes tree
In-Reply-To: <20191219223030.1747f04b@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191219223030.1747f04b@canb.auug.org.au>
Date:   Thu, 19 Dec 2019 14:37:02 +0200
Message-ID: <875zicxzip.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 19 Dec 2019, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Commits
>
>   987e379d7500 ("Revert "devtmpfs: use do_mount() instead of ksys_mount()"")
>   9bd5ba4fe25a ("Revert "initrd: use do_mount() instead of ksys_mount()"")
>   fa31001c96ad ("Revert "init: use do_mount() instead of ksys_mount()"")
>
> are missing a Signed-off-by from their author and committer.
>
> Reverts are commits too and should have reasonable commit messages.

Confused. I can't find said commits. And can't fathom why they'd be in
any drm-intel tree.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
