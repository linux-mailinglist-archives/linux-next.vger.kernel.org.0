Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73800A61B3
	for <lists+linux-next@lfdr.de>; Tue,  3 Sep 2019 08:45:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbfICGpp (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 3 Sep 2019 02:45:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:47048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725956AbfICGpp (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 3 Sep 2019 02:45:45 -0400
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5E7A522D6D;
        Tue,  3 Sep 2019 06:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567493144;
        bh=JNy+RG/rPQCx1FreCBaX6JtGkv8mB3yfPecE6+x9TSE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xDIUaYe/Tv3y4lFZY6ViKO8SZ38bNMYmyIvB/oADCo0XAi8xNuyS1Bxulq1GHm5ly
         PYOV8JNoM7hEWREwbiUHtbDStpamQbYE0wyf4t+uXRF/eEZfCzEuFuv9k5tHJojpsE
         q7pNeD4KQOnxkYgCd12ANit5OoIDV6sDFuOVVYck=
Received: by mail-qt1-f176.google.com with SMTP id t12so18357771qtp.9;
        Mon, 02 Sep 2019 23:45:44 -0700 (PDT)
X-Gm-Message-State: APjAAAUS6c94EZ4XbwfLcYNFDoubdK5boQ8xZaf7/sqGuj0tchMpuNHj
        Sdyi/+4brB/pNDNLf7rIAZpvrngBqumNKakcYQ==
X-Google-Smtp-Source: APXvYqzE7YyOulgfJmSFt0YwRCLQoQ5tK8cMVRupQFfOX2d01LXsASi/e+ktTbqJIis+/lMH/5dwqbiWcIGzLa6t7+4=
X-Received: by 2002:a05:6214:1042:: with SMTP id l2mr3257037qvr.39.1567493143490;
 Mon, 02 Sep 2019 23:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190903153718.14b7a5e7@canb.auug.org.au> <CAJKOXPfokg493On43AJkx=YWz-6Tee8_G+Mha9cnLVeBvyb9mQ@mail.gmail.com>
In-Reply-To: <CAJKOXPfokg493On43AJkx=YWz-6Tee8_G+Mha9cnLVeBvyb9mQ@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 3 Sep 2019 07:45:32 +0100
X-Gmail-Original-Message-ID: <CAL_Jsq+xbHKsxTVLvWfa6HiPNuDR_MJhmeiaUBOFf05jceTKbg@mail.gmail.com>
Message-ID: <CAL_Jsq+xbHKsxTVLvWfa6HiPNuDR_MJhmeiaUBOFf05jceTKbg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the devicetree tree with the
 samsung-krzk tree
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guillaume Gardet <guillaume.gardet@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Sep 3, 2019 at 7:32 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, 3 Sep 2019 at 07:37, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > Today's linux-next merge of the devicetree tree got a conflict in:
> >
> >   Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> >
> > between commit:
> >
> >   5833f5a5daf3 ("dt-bindings: gpu: mali: Add Samsung exynos5250 compatible")
> >
> > from the samsung-krzk tree and commit:
> >
> >   553cedf60056 ("dt-bindings: Convert Arm Mali Midgard GPU to DT schema")
> >
> > from the devicetree tree.
> >
> > I fixed it up (I just removed the txt file, some fixup will be requide for
> > the new yaml file) and can carry the fix as necessary. This is now fixed
>
> Thanks Stephen.
>
> Rob,
> The conflict is non trivial. I could drop the patch, so Guillaume
> could rebase his patch on top of next and send it again for inclusion
> through your tree. Any other ideas?

That would be best. I doubt Linus wants to learn json-schema. :)

Rob
