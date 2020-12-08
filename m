Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B0402D2A38
	for <lists+linux-next@lfdr.de>; Tue,  8 Dec 2020 13:03:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729313AbgLHMC6 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Dec 2020 07:02:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:46650 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729306AbgLHMC6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 8 Dec 2020 07:02:58 -0500
X-Gm-Message-State: AOAM533DYu3wfDmOSERkPzGEK8OtXNGj3ZH4ifLAFHSBNKyDk8uM45id
        9siU2VSSJJVe7JuAluuMvy5HZruhLDpnu5/nQak=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607428938;
        bh=6E+/xx8/WgeZGFQ9PAz+biDFk84qEvMiX+TLWzxAc0s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eZqGpb4vyQpsBgB/VHXFLrHn8qKeDEwAHHfBBD0snhpb9X0fFe6Eghog9WdbtG3+p
         uq/cwBSy3H5NShsT5l1BxKZsoZ1dSQRmUFa9Nq20s8xb89sXot0yCZqDoxsLgLDnAT
         yPLpBUGc4Wfqhd//3Dh7I/a3pcJxR7ov4WgMY+y4PudVvPmhAY8ru6beVCPwePAzsm
         OjMhv1N7idC7/AQHJ+WPAg0UO7FZskVcToI8L+4vSKufWrmHbCwA9XO9HaVU6aZgb9
         iccjruwyzKhr20nqOw7cZ+KzmW1nWX8ViVmjuoCffk5FSKmaViRxu+51yJVUhDUyIu
         qWCjjnBTNNung==
X-Google-Smtp-Source: ABdhPJy8TyuvYY9m2GjZ8f5847BNI2ptrWVvXgT01U1tPx3NcnIAx3w6HYeFoub3BUT46klH8XLYvWwMkyvrOpuKWCU=
X-Received: by 2002:a9d:12c:: with SMTP id 41mr16162083otu.77.1607428937220;
 Tue, 08 Dec 2020 04:02:17 -0800 (PST)
MIME-Version: 1.0
References: <20201208223919.18a80092@canb.auug.org.au>
In-Reply-To: <20201208223919.18a80092@canb.auug.org.au>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 8 Dec 2020 13:02:05 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHmQV+CCMS7HAnZP-4U=j3jSq83tvX+2O9ke8biJUcCvg@mail.gmail.com>
Message-ID: <CAMj1kXHmQV+CCMS7HAnZP-4U=j3jSq83tvX+2O9ke8biJUcCvg@mail.gmail.com>
Subject: Re: linux-next: Fixes tag needs some work in the arm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Russell King <linux@armlinux.org.uk>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 8 Dec 2020 at 12:39, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> In commit
>
>   4812d516af55 ("ARM: 9027/1: head.S: explicitly map DT even if it lives in the first physical section")
>
> Fixes tag
>
>   Fixes: 149a3ffe62b9dbc3 ("9012/1: move device tree mapping out of linear region")
>
> has these problem(s):
>
>   - Target SHA1 does not exist
>
> Maybe you meant
>
> Fixes: 7a1be318f579 ("ARM: 9012/1: move device tree mapping out of linear region")
>

Oops, my bad.

I think we can drop the Fixes tag entirely - I added it to the patch
when I sent it to the mailing list because it fixes a patch that had
already been queued up by Russell at that point. However, I don't
think it is that important to capture this relation in the future,
given that they will all end up in the same mainline -rc
