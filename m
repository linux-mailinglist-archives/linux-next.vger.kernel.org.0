Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 022CE19E9BB
	for <lists+linux-next@lfdr.de>; Sun,  5 Apr 2020 09:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgDEHXQ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 5 Apr 2020 03:23:16 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:22596 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgDEHXP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 5 Apr 2020 03:23:15 -0400
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 0357N4D1018483;
        Sun, 5 Apr 2020 16:23:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 0357N4D1018483
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586071385;
        bh=rDBr6Z4PlmrNk6qXgwDFt7g6UkYgRhKbHk3RIA0gRnA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QWS4v1+Z7xuIvfQ/SZK05czrsohjzLqiB9BwiKCGUudBvtXyXZ4N2CqFuDU9dIgvl
         KW2wRkC5nhY8NilidZC++/7PSgl1LXozE9e8q/5LAibclOiQSA8ja+uhuJZ1rTJGlO
         vRcoyOmBnpeQdZM6gRJhHwPeNtgRvCMNQ1Qoe3MW3qbkwC7rbAT+s02OFqsUMxKBb6
         YIs22yE6z5H0dpFrFUjo86bNngRs4v218r3Sjyo8i/J4koXcMZ7lZUe7rfkjavAJ7V
         ryAMt5/Go4T5uQ+AINBoPpYW95T/edAok8R8NItZRUPB1g5varpI12/BItA6yZXlaS
         kGSoThdytAhLA==
X-Nifty-SrcIP: [209.85.222.48]
Received: by mail-ua1-f48.google.com with SMTP id y17so4290570uap.13;
        Sun, 05 Apr 2020 00:23:05 -0700 (PDT)
X-Gm-Message-State: AGi0PuaxEqe1q6FWpKNV5MKR4YOk6GvyP5wg5ChKdL6ZJyXvIvcAikYM
        vQ97sGV8Gf7EcFkEW8cQ/QO4YG9OXODil0pqi6s=
X-Google-Smtp-Source: APiQypLR5VMNv0uM0sAR6/Zl4HAGSg7rAsknyqO54Hajt+/AYtLDU4d3U07TNecOOhrPJwL/v9FmF2EERpjRwXogJfA=
X-Received: by 2002:ab0:768b:: with SMTP id v11mr10890922uaq.109.1586071384017;
 Sun, 05 Apr 2020 00:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200405145820.466f886b@canb.auug.org.au>
In-Reply-To: <20200405145820.466f886b@canb.auug.org.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 5 Apr 2020 16:22:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQeefNnKVxauoPeJiRFZs1VusmTgmdKLdsjd9WyxyxbbA@mail.gmail.com>
Message-ID: <CAK7LNAQeefNnKVxauoPeJiRFZs1VusmTgmdKLdsjd9WyxyxbbA@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the kbuild tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Apr 5, 2020 at 1:58 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   4075db8ab43a ("x86: update AS_* macros to binutils >=2.23, supporting ADX and AVX2")
>
> is missing a Signed-off-by from its committer.
>
> --
> Cheers,
> Stephen Rothwell

Thanks.
Now added.


-- 
Best Regards
Masahiro Yamada
