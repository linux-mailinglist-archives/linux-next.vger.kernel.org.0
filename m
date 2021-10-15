Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A89142E532
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 02:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232201AbhJOAXP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Oct 2021 20:23:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231894AbhJOAXO (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Oct 2021 20:23:14 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E020DC061570
        for <linux-next@vger.kernel.org>; Thu, 14 Oct 2021 17:21:08 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id x27so34475344lfu.5
        for <linux-next@vger.kernel.org>; Thu, 14 Oct 2021 17:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=axcc21xdI/dvORlK9JnY4plyzJWNbNS1Oplgc4UgVPQ=;
        b=Vkna6zOYpmrV6tfJTpvlreMclp67ltxLbYGSiwE+44ex2NwtqiQS8YhV7jr/PeCtNF
         bIecXGY3fpYF7Q9pPdaUWzd3fjd9PCTU+RsVkROOQnikztXmitWv039xuwlFszGxg5Lw
         /LRZcYlWN5eQjrYAKVXF1WfuxnIhmYtQj30kaSIgQH6kO31YIjcV5MbB5MX5HjULHXvg
         BdPn4vtiV+29Y1ce90UjbWU8qEG0Q3/8X+lSWSRzx4IwU2/YjkGP5mXV80vW0T6o/dkg
         JLtY6iJrK5NmqDpBNibkvByacmoSSoQrvsqE42gOoz/jX8RV7hTDl7Z2u5Kpkqw2Qs1m
         i0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=axcc21xdI/dvORlK9JnY4plyzJWNbNS1Oplgc4UgVPQ=;
        b=yrhwcsS2VvPuLREwVVlv7mXl28DAY5YCvRUIgEH7IGc04wqDcALR0t8UsPzXW4SHVt
         iXhJxKjknInEDmJT8cTAE/8dDpCtaZZ4uOoWj8z//R7+UnCHGLZQ+C4x3K80z18Tfwg4
         2PIVyDJpsXIAalMrmHH32nv/rgQNu968Aq2zNfRB0K+OfQ/fNfS56GeUba/bf4bJOE08
         hBvlqZxEjlx+EaS3+vhdEIiKJZeyhibpCaX/KWMZbNT/d/flSrfWWJwVEatZmIHh+nS9
         erNaUpZLyB9EVJhmEu8cM6f/DHdxMWcqjVGHzmHI1gHXNWSr0Gb5Yl1EKVyL9ee05R6j
         t0HQ==
X-Gm-Message-State: AOAM532M+NieK9Kq0raz1lifBaU3xJQ9uCSrj/xLsNXP8xtloc0sVKI1
        ZlRy/LTDwf+FhNWRXsBfts4IU1F1OKX+/r6PesZnVA==
X-Google-Smtp-Source: ABdhPJwNeN0mOd7mY/vsrY80L4MJjAYh7Wko7XKqQaD5V0rIKucUbvX8H4lpmKqsHw9HeLJ5Mhu/GMSZZ3EU7mlTU9M=
X-Received: by 2002:a2e:b690:: with SMTP id l16mr2155205ljo.112.1634257267086;
 Thu, 14 Oct 2021 17:21:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211015095327.42344a21@canb.auug.org.au>
In-Reply-To: <20211015095327.42344a21@canb.auug.org.au>
From:   Todd Kjos <tkjos@google.com>
Date:   Thu, 14 Oct 2021 17:20:54 -0700
Message-ID: <CAHRSSEwR9c1jV_Hy6DbH9aZ5Q02AeR_dkay9W9od0RpiYKdgLg@mail.gmail.com>
Subject: Re: linux-next: Fixes tags needs some work in the selinux tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Paul Moore <paul@paul-moore.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Oct 14, 2021 at 3:53 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   fef994d85ac9 ("binder: use cred instead of task for getsecid")
>
> Fixes tag
>
>   Fixes: ec74136ded79 ("binder: create node flag to request sender's
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> In commit
>
>   d1c927fb8b52 ("binder: use cred instead of task for selinux checks")
>
> Fixes tag
>
>   Fixes: 79af73079d75 ("Add security hooks to binder and implement the
>
> has these problem(s):
>
>   - Subject has leading but no trailing parentheses
>   - Subject has leading but no trailing quotes
>
> Please do not split Fixes tags over more than one line.

Stephen / Paul - do you want me to upload a new series for this or is
this something you would normally do since it is a simple change?

>
>
> --
> Cheers,
> Stephen Rothwell
