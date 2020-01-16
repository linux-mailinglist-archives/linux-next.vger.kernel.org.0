Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2FDE13FC03
	for <lists+linux-next@lfdr.de>; Thu, 16 Jan 2020 23:10:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389613AbgAPWJs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 16 Jan 2020 17:09:48 -0500
Received: from mail-lf1-f45.google.com ([209.85.167.45]:43943 "EHLO
        mail-lf1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731371AbgAPWJr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 16 Jan 2020 17:09:47 -0500
Received: by mail-lf1-f45.google.com with SMTP id 9so16792962lfq.10
        for <linux-next@vger.kernel.org>; Thu, 16 Jan 2020 14:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ma3+17ZZw0mon2WBoQcLIrloN+FKMVrAslE65nnRmDA=;
        b=kZT+DulkHCqy+z9iJX+SHAKY9BwVQlJATSgdWFeUbn7HaJQDtzziiH3vaLXlz4iKwN
         u5yD1A/ZIU6Q972Sf8Y6Ylc1c+wQ7VMa+EcHijAzmMAuucz9hf7NyhjRkGrV2Rec/hzf
         3UEb/tttT/0v1oxYKXmSzyRqPmzHA0Mdt0O/15NddIbfeEk1mR2FjW5m79XhkbEX/u5I
         2uYn9A6U5G7WrcuLQWORCOIg+rL71/igO6Gp11Rw+CKS6/LZxOFKlWlyGDwtpl4/0sZS
         ymWd+XgIIJ+8XR8U/h0mt1jm74DGkXiSMFHxJ6Q6R+lF02SRPPGkKur13KBVrX+5bCS3
         uYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ma3+17ZZw0mon2WBoQcLIrloN+FKMVrAslE65nnRmDA=;
        b=VY+lfEXeYWi36A/0/UF2O253NBEHsjj3UsuZO21rJ9yb8jv+Jv2PLb3pNGzwlMMjc0
         zj17s7yl39LKmuDos4ivvROmagdcK4byzEjm3sWvgN6YCMGU2lGEPiUlm7UPUxsg274s
         G9j17hSBa6gSY94AmulVwf974y+4aeqJsdFInC+65r2UgBAhkk2qo2pE2h0/ENhF8vAK
         8vra6vJVUQ4HzZziotibk0+KNeQOHtqtk7vxpFxcvwl1uj9/YA5idrBtbQMp29n+wvgf
         jphCKrNJJ34zIVw9p+GrIUewVyp5w9cJmid/y2kY3i54f5WBM2TEe8movGZS6eR2CtHh
         e8NA==
X-Gm-Message-State: APjAAAWrSi5TQY3P56DTaksuzuzP+EXY6L9EXYoVorTZWZsjSo+XJYYX
        npJLysN7OKHeqGOAYQrhHHW44+9ZpKtrKGgKmidv
X-Google-Smtp-Source: APXvYqzMOxzibWcE6CtAi+rGfwOr+6ooiwokDkgIntDt/gMGu/mDs+ST/UaDzUnKHlt/sxNtsDRsfQRolFYXIA/uVs4=
X-Received: by 2002:a19:dc1e:: with SMTP id t30mr3612160lfg.34.1579212585522;
 Thu, 16 Jan 2020 14:09:45 -0800 (PST)
MIME-Version: 1.0
References: <20200117090248.392f40cb@canb.auug.org.au>
In-Reply-To: <20200117090248.392f40cb@canb.auug.org.au>
From:   Paul Moore <paul@paul-moore.com>
Date:   Thu, 16 Jan 2020 17:09:35 -0500
Message-ID: <CAHC9VhT_mCdJvm-ndx+A=ezBUqKBP1D0WG=9TT2H4pwyspTydQ@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the selinux tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jan 16, 2020 at 5:02 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> Commit
>
>   6bae00459f0c ("selinux: do not allocate ancillary buffer on first load")
>
> is missing a Signed-off-by from its committer.

My apologies.  Fixed and force pushed to selinux/next.

-- 
paul moore
www.paul-moore.com
