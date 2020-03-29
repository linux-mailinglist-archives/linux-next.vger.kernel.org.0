Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B0731970AA
	for <lists+linux-next@lfdr.de>; Mon, 30 Mar 2020 00:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729119AbgC2WBE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 29 Mar 2020 18:01:04 -0400
Received: from mail-yb1-f172.google.com ([209.85.219.172]:39742 "EHLO
        mail-yb1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728823AbgC2WBD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 29 Mar 2020 18:01:03 -0400
Received: by mail-yb1-f172.google.com with SMTP id h205so7963559ybg.6;
        Sun, 29 Mar 2020 15:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kAA7/YzGXhcKB7pmnLDjhGtQei6hSiehda0pcnmqcxs=;
        b=hcdht7gX/aAluLAcaUADD2aqp8ZKzKIFjkVyXd94dF0qE/edx1HS8GuGeAWWOeIfLo
         8WVBDqF9Oy7vA0OpD1zDT1LlxrVmhAGNFVN1CwfKgQI+stjW4fhWbKiPFLYLnkHlIbTu
         nwLTvEENn3CDe5dHKuIruzmTZNLTZ06cHckHBtkHncUD3UE5ejNi7qOQ/gcKjesw3wi1
         9wxNeK3lQQ1MKXYJyUCXQYmRTtqgpSjCzGZznP6Lhk3R/Gs+a8MiuiGn8k7AmrbulE3L
         cYtJJyTkQQM6kmCupI7Xp13YQIUiwjRcmon0mdJfSckS90o3q5png4ZJ1hQFgKZo8P2p
         gKLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kAA7/YzGXhcKB7pmnLDjhGtQei6hSiehda0pcnmqcxs=;
        b=W3nvP+SzGEkQPMr3Ctq4ZIVPLx+8jTwYPTvuUJ4RjARg/FynV94VHbgeGUaEDbN4T9
         bSDFKregWN+DwUKlTjd0zI6Ixd+qLFZEKc+bh14kt2sOmAIK2gRV9QcmnjFWe/kIicD0
         fAYimoK6+f57DwMVDg7mv6D9IuVhU5L1RQ/Ah1JyowUbLnLU3Qhi72uG4WZBVhZnv0Ku
         xKO4ivE3Hgo9MipWxmLzhHHNfIyEBf84rA6gX3kt2WTcs3WJEqL3O6cMkZooXdi5lUGo
         IViEtS3hkZyvBI83J7mKMyAZbsmEpCpXfwsVGPM2Z8m8oyFSmTfrWWC6cLhFlNDCRlVk
         8ItA==
X-Gm-Message-State: ANhLgQ1jwWKztBdMuphS9N7awJETeeBD9oGSvKzcNMaAvdEKjXAJHWq/
        /WBemJFlpg6sidOAlsnSz29vK+hE5Tpadu2LnWgDSPZc
X-Google-Smtp-Source: ADFU+vsUE4odt8ZrG8rT7+n/iARZ44nDnTbOYlD8uPNBIvBlzkdgRjKnout8R4kZAhGYFLeRl0SoeUrxykAMT3/EXa0=
X-Received: by 2002:a25:cf12:: with SMTP id f18mr9868965ybg.167.1585519262570;
 Sun, 29 Mar 2020 15:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200330085747.082749d4@canb.auug.org.au>
In-Reply-To: <20200330085747.082749d4@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Sun, 29 Mar 2020 17:00:51 -0500
Message-ID: <CAH2r5mvAU3TBD-T-d_=-kQwbGoNpRGyCiL4BWiUEJOZfpJjkjA@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the cifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

fixed

On Sun, Mar 29, 2020 at 4:57 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> ommit
>
>   cfc825ccc046 ("cifs: update internal module version number")
>
> is missing a Signed-off-by from its author and committer.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
