Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48D651A0D7B
	for <lists+linux-next@lfdr.de>; Tue,  7 Apr 2020 14:22:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgDGMWm (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Apr 2020 08:22:42 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:32799 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728146AbgDGMWm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 7 Apr 2020 08:22:42 -0400
Received: by mail-vs1-f65.google.com with SMTP id y138so2046331vsy.0
        for <linux-next@vger.kernel.org>; Tue, 07 Apr 2020 05:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z511MDYhv4o+xquNAW2DROMbGPhQBRu4/JH0RaTSkLw=;
        b=rq6AiC7dwdXCobVOO+f+WNp1k+3JC8UWM9UFQqKhPm1K0hzAOn92rvaQ0LXCwMHysB
         0SxkT3AujfliCTQxZyyNA/na195T1BDWVlt6CfMVBpe3NryLSdp8m0sujbYkOTD4gcvc
         2ZF2+QsUuU+iVep3ZE9aJca+iEiaIf9yXU49eYBazU0cohQt7SHKPLigGiIDR5obOKUm
         0Dlaq3eiSq7Vl5CGwOaCXpMq7jm78RfvLt2+7l+JBRwp/qAsOWxZFrMlYVR28MGKM4iC
         C5FScwHdCdIpS/eGIDFUR8j5JRZwvn0ETfPjZYZOLimGajlHKPFiwRqdHCLf2PUIC8KZ
         e3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z511MDYhv4o+xquNAW2DROMbGPhQBRu4/JH0RaTSkLw=;
        b=s2rYOW5EszxZyOkVHB7w5ZCDbFlUkr7juga03ZyKj4s6XHzMbCILlsqz64825msRoS
         Cilq0r4ojlf5iBRNkM7nDt8B/RnrkAis1WvsaPjHZVb8LX0hWocbtEsu3FFzLqc8QFU3
         qo4fYzpZLw4zJNcoxpohy0Q0NPLxag78tkPQ6E1RgIRkWUn7NWP23+488tZ672RZuTG0
         Z7V62POtMh4EgU9vb+0igYmk6l0VjbvAHU4zYCLdubH92Iy65TPyZAcPn42P2bqefyEQ
         0GI54ivq1dfVoz+wZzGDfSgqLx/RG/j2DMBe7A3+IBZy/Nfzma18tYdDoabJE8gQxW0V
         zFeA==
X-Gm-Message-State: AGi0PuYc2/qYgBdKWN/hgnORjP0KZuIjgayLcKtRPwQ8IXOmBr+j9jJv
        xL0YUD0XXYXsXG3LTcUxsF0IHQtuBawSWWeOwSeKqw==
X-Google-Smtp-Source: APiQypJOloediqTcP7bVJrSj3o2Nu6Q5oLyGH8q9e/MG+HlSs5+WgZ/5WabTTYh0HGGAyMoVlmBWh0gWQ1bGQpAECuQ=
X-Received: by 2002:a67:80d6:: with SMTP id b205mr1428650vsd.137.1586262160955;
 Tue, 07 Apr 2020 05:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200407075207.0bfc0e71@canb.auug.org.au>
In-Reply-To: <20200407075207.0bfc0e71@canb.auug.org.au>
From:   Mike Marshall <hubcap@omnibond.com>
Date:   Tue, 7 Apr 2020 08:22:29 -0400
Message-ID: <CAOg9mSQEeQQbt2v-fsO6xg-TJS7oucZZp4C2kbozfNvFjtFL8Q@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the orangefs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

fixed, thanks...

-Mike

On Mon, Apr 6, 2020 at 5:52 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commits
>
>   aa8891f95484 ("orangefs: don't mess with I_DIRTY_TIMES in orangefs_flush")
>   4501ab590e3c ("Revert "orangefs: remember count when reading."")
>
> are missing a Signed-off-by from their committer.
>
> --
> Cheers,
> Stephen Rothwell
