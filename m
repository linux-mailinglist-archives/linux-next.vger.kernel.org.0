Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35AD21295F0
	for <lists+linux-next@lfdr.de>; Mon, 23 Dec 2019 13:20:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbfLWMUX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 23 Dec 2019 07:20:23 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40514 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbfLWMUX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 23 Dec 2019 07:20:23 -0500
Received: by mail-lj1-f196.google.com with SMTP id u1so17536163ljk.7
        for <linux-next@vger.kernel.org>; Mon, 23 Dec 2019 04:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6maFNccIr4FVjyCOffu4Z8M0jZ8asTN08k4BjiYMbgY=;
        b=mvJq3RZ5/SO08RF45Cl4hy811+yrHDwoEQjAneQaQEVZstNfZP7KOidREMLRqt8oAb
         lPq5feT+FUQiCdFKwGpdVuXWmBOFfbm9SEAmdnvaskLV2wy03xGcAh0aR+SC3BT//2TC
         Rd4/AyqnxvFS8ouYHAgY4wUEJ8BUiqNEYp9wDM3kfhGy2aDsKGQjxoWnJws/sb3VG85W
         KVzzp2GFYXa+WinThnUTD+RP99hXmHYiTtqNDApmbMj/Ww1UjZZpNM3V/agIA4gGdlOn
         I6S+TCTdVAB76SSZ9vwiPkkRe/D+ykxnaA7DXTCZVnyR50UfX/6udCPA6Axaf+Xx5ad/
         Hpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6maFNccIr4FVjyCOffu4Z8M0jZ8asTN08k4BjiYMbgY=;
        b=Bf25hi2DN10VJmiQC7FKAoX3Yka1hZW0eGhzjuyZMC/TJ8C9mGCFyi7QBfyBkhYU8I
         +EXCSmoFuTaqeVmP+oAauC1+R52Uy0fknYX3z16iEYxpZW0Aa3bB/DK49yq9bR92vHUE
         UEYGrTCJIQKdpDXmNxjAQ/TAcEpQ1Ab2PRSGgmrAOxyJg6TV/cwGl55LmBjCrY5zpg7Z
         KkdN+nFoXaC1hKr1Kf5LOzrSdx4fuofJTkCgHs6H9DbduDts8vWw/CMlzG/WinK0iPzR
         1doLNRIvboD7Svp2QDdLtgwGxkTVgqXBouxI7Cr/IhqwqOlRmM7BNWqYXNcPO9bzyO4K
         1JrQ==
X-Gm-Message-State: APjAAAUJbI3FAyLLWkVtqD5Nah6zQsiNrOabZzWqH/CvFSAnMPPxtfTJ
        ftly6jJNldvcKpJ75ogXdkHlsz65Zcljn4QqGtqQgg==
X-Google-Smtp-Source: APXvYqz6tEPq0Je/g2RvV/4JEMlHwxH5Lsaksz2cZf1nATKkAhAzRATNBacsWQl7vRCo0BaBd/u71PIfzDoEUQyFHDM=
X-Received: by 2002:a2e:97d9:: with SMTP id m25mr4441817ljj.146.1577103621011;
 Mon, 23 Dec 2019 04:20:21 -0800 (PST)
MIME-Version: 1.0
References: <20191220160639.3406a5de@canb.auug.org.au> <CADYN=9JjqvNWEsHLW5+GgSvkUkuz_6iMpD=X4Vk6nLQXtXa2Dw@mail.gmail.com>
 <yq1tv5t7c25.fsf@oracle.com>
In-Reply-To: <yq1tv5t7c25.fsf@oracle.com>
From:   Anders Roxell <anders.roxell@linaro.org>
Date:   Mon, 23 Dec 2019 13:20:09 +0100
Message-ID: <CADYN=9+FCsq-AaxCV9-qG0tFNZ2w=8cd87+pa2bP8p6LRgrxiw@mail.gmail.com>
Subject: Re: linux-next: Tree for Dec 20
To:     "Martin K. Petersen" <martin.petersen@oracle.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, 21 Dec 2019 at 19:45, Martin K. Petersen
<martin.petersen@oracle.com> wrote:
>
>
> Anders,
>
> > ../drivers/scsi/ufs/ufs-mediatek.c: In function ufs_mtk_setup_ref_clk:
>
> This change was very briefly in my tree. It has since been dropped.

OK, thank you Martin then I know.

Cheers,
Anders
