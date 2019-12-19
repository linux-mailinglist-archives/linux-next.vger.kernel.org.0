Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7971C1262F4
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2019 14:11:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbfLSNLL convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Thu, 19 Dec 2019 08:11:11 -0500
Received: from mga17.intel.com ([192.55.52.151]:44301 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726695AbfLSNLL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 19 Dec 2019 08:11:11 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Dec 2019 05:11:11 -0800
X-IronPort-AV: E=Sophos;i="5.69,332,1571727600"; 
   d="scan'208";a="210456279"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost) ([10.252.11.180])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Dec 2019 05:11:08 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <875zicxzip.fsf@intel.com>
References: <20191219223030.1747f04b@canb.auug.org.au> <875zicxzip.fsf@intel.com>
Subject: Re: linux-next: Signed-off-by missing for commits in the drm-intel-fixes tree
From:   Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To:     DRI <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Intel Graphics <intel-gfx@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date:   Thu, 19 Dec 2019 15:11:06 +0200
Message-ID: <157676106618.16538.6275487528140541951@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.8.1
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Quoting Jani Nikula (2019-12-19 14:37:02)
> On Thu, 19 Dec 2019, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > Commits
> >
> >   987e379d7500 ("Revert "devtmpfs: use do_mount() instead of ksys_mount()"")
> >   9bd5ba4fe25a ("Revert "initrd: use do_mount() instead of ksys_mount()"")
> >   fa31001c96ad ("Revert "init: use do_mount() instead of ksys_mount()"")
> >
> > are missing a Signed-off-by from their author and committer.
> >
> > Reverts are commits too and should have reasonable commit messages.
> 
> Confused. I can't find said commits. And can't fathom why they'd be in
> any drm-intel tree.

Sorry. A glitch in the matrix, as our CI farm is hit by -rc2
regressions. I did the usual trick of pushing the reverts/fixes on top
of drm-intel-fixes to get CI pick them up for a run to get results, and
then proceeded to immediately remove them.

I imagine that if the commit messages got scanned, they get propagated
somewhere else too? Feel free to drop that HEAD completely.

If this is a big inconvenience, we can look into other ways of adding
the patches on top of drm-intel-fixes to get CI working when there
are regressions during -rc1/-rc2.

Regards, Joonas
