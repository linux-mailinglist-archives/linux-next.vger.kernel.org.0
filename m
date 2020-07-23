Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D5B22AA45
	for <lists+linux-next@lfdr.de>; Thu, 23 Jul 2020 10:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgGWIB3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 23 Jul 2020 04:01:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbgGWIB3 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 23 Jul 2020 04:01:29 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C51C0619DC
        for <linux-next@vger.kernel.org>; Thu, 23 Jul 2020 01:01:29 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id 5so3720110oty.11
        for <linux-next@vger.kernel.org>; Thu, 23 Jul 2020 01:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=udszHcSXsT4dQ3NuGugQMUyp4GH9Oigj4Zp+/fN1xeE=;
        b=F3BMSeBeZ+HLzAI3wwQ4zN4ZWw/DyqownjHjQ82cXNtIE4vpJJqqetNX2gv3IYaMA+
         ca0/0T0EScyio7LiFBuNI9iQsjtXOFjgfsPRlHr0SD+rbwohcgmxftm9s5PlgDrtdvAl
         0GondLm/gxwNQCtw0IDwQVLM24CSsULefWPyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=udszHcSXsT4dQ3NuGugQMUyp4GH9Oigj4Zp+/fN1xeE=;
        b=C4N3EYYc/xTd2EO7/yt+RhhpGb2W8t4fgrKYXy1tOxUEKNem1YeryBjyKHKXkyOXm8
         qvFaqd6iRM+Qd0yFhj4q43aohhqab9vLAOnmWjeJwbNBk+NzZmcwi6WNec30/LpKGk+B
         XLpPg5NdO2UgaO5xB9rKZm/nEZZh99nSzPNoSH/t+jGV4gg49342zqSwY4paCjLIhQMY
         dEuxLet57maaLPOJpJKnGwXPTa0Vp6LscmJ5QJjc9lZTMw6YQFDXb0dp9qhCGs5pZ+71
         9Cl72Rq/FFvJ0P7fGDz+bXoEl66Z+Ddgv5zjlwgqhWkkwRWmPo+iCvctSn1HO5n+ETlw
         r5eg==
X-Gm-Message-State: AOAM530/SJ/jwZ4ov0em+EXE+ctzj+rM2bOM9gyfDrgSo5o0YsHiB43i
        z1kMzx5wM8iQRTGvny6Ced0ovIJ2mIdAGqQ8RsI8+w==
X-Google-Smtp-Source: ABdhPJyErzT5Y8MQ0PTeEY2azu7bSVDw5wjEK5u+1316FD7VE3IPZHbIJjK4KSESg+aThLWlAYcVH2ah+V7lo4STqC8=
X-Received: by 2002:a05:6830:1d0:: with SMTP id r16mr3416440ota.188.1595491288375;
 Thu, 23 Jul 2020 01:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200722143417.42b52c73@canb.auug.org.au>
In-Reply-To: <20200722143417.42b52c73@canb.auug.org.au>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 23 Jul 2020 10:01:16 +0200
Message-ID: <CAKMK7uGZ4qdtkD6r_RzRUiEXrumkdAwENuKfKmfsuscQZtkWqA@mail.gmail.com>
Subject: Re: linux-next: manual merge of the amdgpu tree with Linus' tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        Dave Airlie <airlied@linux.ie>,
        DRI <dri-devel@lists.freedesktop.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Jul 22, 2020 at 6:34 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> [I can't find a previous email about this, sorry ...]
>
> There is a semantic conflict between Linus' tree and the amdgpu tree
> between commit
>
>   d7a6634a4cfb ("drm/amdgpu/atomfirmware: fix vram_info fetching for renoir")
>
> from Linus' tree and commts
>
>   fe098a5d6443 ("drm/amdgpu/atomfirmware: fix vram_info fetching for renoir")
>   836dab851903 ("drm/amdgpu/atomfirmware: update vram info handling for renoir")
>
> The automted git merge leaves two "case 12" labels.  I have been
> reverting commit d7a6634a4cfb since July 3 ... This will need to be
> fixed up when the amdgpu tree is next merged into the drm tree, or a back
> merge of d7a6634a4cfb could be done into the amdgpu tree and the older
> "case 12" label removed in that merge.

Yeah this is a bit nasty, I just crashed over it too (btw moved to
drm-next now). Alex is this the right conflict resolution for -next? I
think we should bake this in with a backmerge ...
-Daniel

>
> --
> Cheers,
> Stephen Rothwell
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
