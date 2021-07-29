Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D311D3DA6BA
	for <lists+linux-next@lfdr.de>; Thu, 29 Jul 2021 16:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238009AbhG2OqZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 29 Jul 2021 10:46:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237641AbhG2On1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 29 Jul 2021 10:43:27 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C84C0613CF
        for <linux-next@vger.kernel.org>; Thu, 29 Jul 2021 07:43:21 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id m13so7465588iol.7
        for <linux-next@vger.kernel.org>; Thu, 29 Jul 2021 07:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+UmWBFJr8CZCCI6Hv7anKl8N5XnEyboqlsB/Azk7Fvk=;
        b=W+WSgTckYxDJ3PQIAJIDPz/acxCKtOF3UQEmscCBjbTVF+6lpvtt8UOJK8ynV23PZ1
         j9QnsuAj2AWqhPxI+3PzpkoxiVZJlZChGmwNLM9UPY90l4nIbw7cj2PA3PB8dFpDfStp
         U3WPeV0K/7yCEuYriitsRxR95iKeNneDOGEQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+UmWBFJr8CZCCI6Hv7anKl8N5XnEyboqlsB/Azk7Fvk=;
        b=VNw01hqDYIYeI+T66bg21jUpUTdq1rPkW8GaqTyk/fNvmYNVVOJnEAC7yifzHRQIdv
         2sQUjqdcG/JYitjjhtiqxpoaJ4+nmBZvpc6IrCEqMoPmhOpQPIKJBGeoQJqy/TAp4otC
         v5r25VeeUneXq4FScFc77QFVj04B/NYlwKbO4w85jJDbRBsoV/zRkRbVk8hNxlb1zM6/
         PPCYZikO6fIcT+PAO+gbRt9w5ggSeMBwqKnBrXlIkqL1Jbo4PCi33dOXS7CzGRSnEXei
         g0E8Td6uE1I0nOt4PhcWl8KtlSoeE8IUoIHBGA7uSUkH2cnuyxu7r5Z7FCm5vy+u5hWQ
         8/vg==
X-Gm-Message-State: AOAM531GpQKMLQnVXKBoTcxhUaR58c+RdmxNyhLCA/iuMjXgN0BryvLm
        xmEkDzTFjhm5W1H4DJSgIkeb9e+bkcY7Dn4rdBRZxQ==
X-Google-Smtp-Source: ABdhPJwba+RJ3lGvRq+rfCLLiBleSyA4hT5CDS5/+FuNgREumvyYcfbJdG3n5wXq+ZPnCXxCjmaGneDkyAT917tyH+E=
X-Received: by 2002:a5d:87cc:: with SMTP id q12mr4403406ios.131.1627569800780;
 Thu, 29 Jul 2021 07:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210729111027.33028-1-broonie@kernel.org> <2306c0c4-1312-fcc7-1ed3-406fbd72cf63@amd.com>
 <20210729122521.GM4670@sirena.org.uk>
In-Reply-To: <20210729122521.GM4670@sirena.org.uk>
From:   Rob Clark <robdclark@chromium.org>
Date:   Thu, 29 Jul 2021 07:47:31 -0700
Message-ID: <CAJs_Fx7osL1PAANAVGnbkyk+K1LvB9O-dWxsz1b=cCJMCixUfQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm-msm tree with the drm-next tree
To:     Mark Brown <broonie@kernel.org>
Cc:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jul 29, 2021 at 5:25 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Jul 29, 2021 at 01:44:42PM +0200, Christian K=C3=B6nig wrote:
> > Am 29.07.21 um 13:10 schrieb Mark Brown:
> > > Hi all,
> > >
> > > Today's linux-next merge of the drm-msm tree got a conflict in:
> > >
> > >    drivers/gpu/drm/msm/msm_gem.c
> > >
> > > between commit:
> > >
> > >    60f800b2bdfa ("drm/msm: always wait for the exclusive fence")
> > >
> > > from the drm-next tree and commit:
> > >
> > >    1d8a5ca436ee ("drm/msm: Conversion to drm scheduler")
> > >
> > > from the drm-msm tree.
> > >
> > > I fixed it up (see below) and can carry the fix as necessary. This
> > > is now fixed as far as linux-next is concerned, but any non trivial
> > > conflicts should be mentioned to your upstream maintainer when your t=
ree
> > > is submitted for merging.  You may also want to consider cooperating
> > > with the maintainer of the conflicting tree to minimise any particula=
rly
> > > complex conflicts.
> > >
> > > diff --cc drivers/gpu/drm/msm/msm_gem.c
> > > index 39c35414d7b5,5db07fc287ad..000000000000
> > > --- a/drivers/gpu/drm/msm/msm_gem.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem.c
> >
> > thanks for the fixup, but something went wrong here. The diff is just e=
mpty.
> >
> > Any idea what's going on?
>
> The change modified a function that is simply deleted so the resulting
> diff was empty.

That is the correct resolution, that commit switched to
drm_gem_fence_array_add_implicit() as part of the conversion

BR,
-R
