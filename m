Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C1E28387D
	for <lists+linux-next@lfdr.de>; Mon,  5 Oct 2020 16:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgJEOrt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 5 Oct 2020 10:47:49 -0400
Received: from crapouillou.net ([89.234.176.41]:36846 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726160AbgJEOrt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 5 Oct 2020 10:47:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1601909265; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mSKWE44g/SFazzSz35F0HDw93v+pr64cnMikoaeFFcw=;
        b=kcYY6ernsiuea4kjCPIb/SzTBLp4R7aQBWhtmYvuUr+4BnBk5FAZf6m8cf/G6erBDucJwa
        mLbOZEZwgMebewJlqnu0sgRBppHQDacviqSDDyEycuUi90uKmh3fhWnINY8W9CYA1Q5xzU
        VAZ4wRdRPjViGUkSx54KYdASuZ/O/QY=
Date:   Mon, 05 Oct 2020 16:47:35 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] Revert "gpu/drm: ingenic: Add option to mmap GEM
 =?UTF-8?Q?buffers=0D=0A?= cached"
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>, od@zcrc.me,
        Dave Airlie <airlied@linux.ie>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>, Christoph Hellwig <hch@lst.de>
Message-Id: <B3HQHQ.7DOFKW9A9TEX1@crapouillou.net>
In-Reply-To: <20201005140534.GT438822@phenom.ffwll.local>
References: <20200930165212.GA8833@lst.de>
        <20201004141758.1013317-1-paul@crapouillou.net>
        <20201004195921.GA556605@ravnborg.org>
        <ZE1PHQ.WGCBAFO9R38I3@crapouillou.net>
        <20201005230150.5637fa42@canb.auug.org.au>
        <20201005140534.GT438822@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

Le lun. 5 oct. 2020 =E0 16:05, Daniel Vetter <daniel@ffwll.ch> a =E9crit :
> On Mon, Oct 05, 2020 at 11:01:50PM +1100, Stephen Rothwell wrote:
>>  Hi Paul,
>>=20
>>  On Sun, 04 Oct 2020 22:11:23 +0200 Paul Cercueil=20
>> <paul@crapouillou.net> wrote:
>>  >
>>  > Pushed to drm-misc-next with the changelog fix, thanks.
>>  >
>>  > Stephen:
>>  > Now it should build fine again. Could you remove the BROKEN flag?
>>=20
>>  Thanks for letting me know, but the fix has not appeared in any drm
>>  tree included in linux-next yet ...
>>=20
>>  If it doesn't show up by the time I will merge the drm tree=20
>> tomorrow, I
>>  will apply this revert patch myself (instead of the patch marking=20
>> the
>>  driver BROKEN).
>=20
> Yeah it should have been pushed to drm-misc-next-fixes per
>=20
> https://drm.pages.freedesktop.org/maintainer-tools/committer-drm-misc.htm=
l#where-do-i-apply-my-patch
>=20
> Paul, can you pls git cherry-pick -x this over to drm-misc-next-fixes?

I had a few commits on top of it in drm-misc-next, so the revert=20
doesn't apply cleanly in drm-misc-next-fixes... I can revert it there,=20
but then we'd have a different revert commit in drm-misc-next and=20
drm-misc-next-next.

Sorry for the mess. What should I do?

-Paul


