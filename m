Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35A9943C950
	for <lists+linux-next@lfdr.de>; Wed, 27 Oct 2021 14:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241789AbhJ0MPR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-next@lfdr.de>); Wed, 27 Oct 2021 08:15:17 -0400
Received: from mga07.intel.com ([134.134.136.100]:24073 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239982AbhJ0MPQ (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 27 Oct 2021 08:15:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="293606341"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; 
   d="scan'208";a="293606341"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2021 05:12:50 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; 
   d="scan'208";a="537504651"
Received: from aeremina-mobl.ccr.corp.intel.com (HELO localhost) ([10.249.254.123])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2021 05:12:47 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
In-Reply-To: <CAKMK7uFWFVC0be2foiP8+2=vrqyh1e4mqkuk+2xY+fgSWAExyQ@mail.gmail.com>
References: <20210122115918.63b56fa1@canb.auug.org.au> <CAKMK7uEuJa1J66mo5dS+QRPy9NOENTx95SZ4rU2MeVRTWj7Kcw@mail.gmail.com> <20210122182946.6beb10b7@canb.auug.org.au> <CAKMK7uFWFVC0be2foiP8+2=vrqyh1e4mqkuk+2xY+fgSWAExyQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the drm tree
To:     "Nikula, Jani" <jani.nikula@linux.intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
From:   Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc:     Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chris Wilson <chris@chris-wilson.co.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <163533676481.68716.4009950051571709814@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date:   Wed, 27 Oct 2021 15:12:44 +0300
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

(+ Tvrtko who was recently added as a drm/i915 co-maintainer)

Quoting Daniel Vetter (2021-01-22 10:40:48)
> On Fri, Jan 22, 2021 at 8:29 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi Daniel,
> >
> > On Fri, 22 Jan 2021 08:17:58 +0100 Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > Hm that has been in drm-intel-gt-next for a few days, is that tree not
> > > in linux-next?
> >
> > It is not.

Hi Stephen,

We should be now good to go and add drm-intel-gt-next to linux-next.

The branch would be as follows:

drm-intel-gt-next	git://anongit.freedesktop.org/drm-intel	for-linux-next-gt

Notice the "-gt" and the end of the for-linux-next branch name. This should eliminate
the gap we have been having. The change to add it to the DIM tool is here:

https://gitlab.freedesktop.org/drm/maintainer-tools/-/commit/7b5c2c29cdbc054e8c8fce38f095c56290fc4833

So once all developers have updated their tooling (for which they will
get an automatic nag message) we should be all up-to-date for future
merge windows.

Regards, Joonas

> Adding -intel maintainers to get that sorted.
> -Daniel
> 
> > These are the drm branches currently in linux-next:
> 
> Oh for ordering maybe put drm-misc ahead of the other subtrees, -misc
> is where nowadays a lot of refactorings and core changes land.
> Probably doesn't matter in practice.
> -Daniel
> 
> > drm-fixes       git://git.freedesktop.org/git/drm/drm.git       drm-fixes
> > amdgpu-fixes    git://people.freedesktop.org/~agd5f/linux       drm-fixes
> > drm-intel-fixes git://anongit.freedesktop.org/drm-intel         for-linux-next-fixes
> > drm-misc-fixes  git://anongit.freedesktop.org/drm/drm-misc      for-linux-next-fixes
> > drm             git://git.freedesktop.org/git/drm/drm.git       drm-next
> > amdgpu          https://gitlab.freedesktop.org/agd5f/linux      drm-next
> > drm-intel       git://anongit.freedesktop.org/drm-intel         for-linux-next
> > drm-tegra       git://anongit.freedesktop.org/tegra/linux.git   drm/tegra/for-next
> > drm-misc        git://anongit.freedesktop.org/drm/drm-misc      for-linux-next
> > drm-msm         https://gitlab.freedesktop.org/drm/msm.git      msm-next
> > imx-drm         https://git.pengutronix.de/git/pza/linux        imx-drm/next
> > etnaviv         https://git.pengutronix.de/git/lst/linux        etnaviv/next
> >
> > --
> > Cheers,
> > Stephen Rothwell
> 
> 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
