Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6191D14BEDF
	for <lists+linux-next@lfdr.de>; Tue, 28 Jan 2020 18:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbgA1Rre (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 28 Jan 2020 12:47:34 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:41289 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726111AbgA1Rre (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 28 Jan 2020 12:47:34 -0500
Received: by mail-il1-f194.google.com with SMTP id f10so11434906ils.8;
        Tue, 28 Jan 2020 09:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+k9I/zy5WnzhP8AJXoHMWTULu2SIA+5CA0oszI/obuk=;
        b=WcWsTGox8x7cX97PMT77vE7NtFF1OjKHGOhWA+6niUTW9T1kM+joHtD5rN/bwL8I4k
         QKl1dR+nRcCTRUIBZslbKX1KA5c3HemJbbOS/MYuuCfF5Ov7Dq7/T432G4OCqNwzZoUP
         +/lQRvHiUBx2tT36q0cL97t01fGkXxG0dSSMe0imojVEKpc1gJ/1aYmWas/a6LBZHIzD
         WO/IjrjAXqKoKI+xYoyw+9ct2BVQpp6L9BFG0VU3GyGEoQntzH1siLzyK7ooufJhQvT7
         q7dgRYIflMvt1EMlE4AqQTNOwNGHZtTTgiatjQ4rj+J0bW0nUaeW82TZ9Z9nkg2V42Hs
         zBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+k9I/zy5WnzhP8AJXoHMWTULu2SIA+5CA0oszI/obuk=;
        b=gH3oxiOOxqwJjTadqjsYks1q5DoDq1LhnGLTZKfrThXI8DEq6BdRW95NjWYsClKHD2
         njzTciVNvmfnr3Mp85bqOPItjSaaSUiPFjCpXgiGFbapq90ByQRZMHLDObyAJSc2BEbq
         jM0bH/JkcT4SoqKbpPl5sSvNsOvFkl6coKPZFjXyfQzKGYdst7mEhhKx2A30P3c96uVK
         675BHek9/wPMr59PAZhPjecbq28mxTNNX8O/DERICeUwl4bb9220QrCuvR9N9RlTXEl9
         rI8Wlw+00NiCXEaFXkBDoRpF/QQfdOH80jAk5n3tUF0Ne/rdPhGwZsimgRwYsOYFG9b+
         M2Ig==
X-Gm-Message-State: APjAAAUrarTP885/NRduvgKIlEf7xRFXFJFdAsIw/2C/QsWctxfvyCeT
        RiHUyWm0lMb/8FmnNLA0GOJzihoJZsIups4EIXao3jsj
X-Google-Smtp-Source: APXvYqy5CYo3D8gbIP/JcsA+WxlY+wi2dZeV4qT0x/teYocTBjcqOhdsOhNvhZX2Ar/HDTonbmAjXHiLjl9DDmzmwlk=
X-Received: by 2002:a92:cb8c:: with SMTP id z12mr20188900ilo.5.1580233653351;
 Tue, 28 Jan 2020 09:47:33 -0800 (PST)
MIME-Version: 1.0
References: <20200128065742.397cd3d2@canb.auug.org.au>
In-Reply-To: <20200128065742.397cd3d2@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Tue, 28 Jan 2020 11:47:22 -0600
Message-ID: <CAH2r5mu7Sc8H1nxTpkkTLntXQzORjg7H_6yT=44-ZoOi=QU1NQ@mail.gmail.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the cifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

removed patch temporarily

On Mon, Jan 27, 2020 at 1:57 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Commit
>
>   503e9ac76c90 ("cifs: update internal module version number")
>
> is missing a Signed-off-by from its author and committer.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
