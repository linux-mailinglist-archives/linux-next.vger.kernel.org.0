Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74A0A441A67
	for <lists+linux-next@lfdr.de>; Mon,  1 Nov 2021 12:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232066AbhKALEu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 1 Nov 2021 07:04:50 -0400
Received: from mout.gmx.net ([212.227.17.20]:48419 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232191AbhKALEt (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 1 Nov 2021 07:04:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1635764533;
        bh=6BnVRDqnhVQAfvZaew0wzOzHXs7hYC/8rBJZUhkNBxQ=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=JMalodGx+ps/3rCvm0TGbk9jOBWER9uKf/jwvokRAaTfVWW9F9Qp1UokywLZPKctj
         Rh3PWwXE7VQ8cPDTVL107nqpB/P8d+BBp3nGNNrnGxGiwVfSqoXQPd6bLNMwzV21RV
         IInw6iXH/486jmhclf3JCF8phyPDTHO1po0en2P0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.177.231]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWici-1mATcL0iFc-00X0h4; Mon, 01
 Nov 2021 12:02:13 +0100
Message-ID: <38022e9f-4b1b-2fac-2098-acf45f2f59c0@gmx.de>
Date:   Mon, 1 Nov 2021 12:01:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: linux-next: Signed-off-by missing for commit in the parisc-hd
 tree
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Parisc List <linux-parisc@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20211101214403.47d36f6c@canb.auug.org.au>
From:   Helge Deller <deller@gmx.de>
In-Reply-To: <20211101214403.47d36f6c@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:fq1Hn7mjIU603CMi1AFS6ksT5GSU++YfUXwRQ2hTgdThLOp+VJT
 qUMK04lde6yEbh+beiFq7KJBq/HognEm7iYrlz4FuOQFdbmTl5o2lCv2hj0hXOky2oFLI8t
 BJ4hbPQRGgTca+Eqfbzt1vHGc2p+zUOkadEx/+pE4PvFHW9XUGJQvKNGMnEnJkt8FMoSV0t
 rP+7wPSY3uva9cYqsC8OQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:COJ7QdyaPIM=:QVaX88KqLcS1jDTX+AiYtX
 +9bZ0diNFx/Wj+lmPOFCaVaBmtXdyfUC+S2BllwT1YcjsFJLFgbzWazHpE46Z0JseMQj02onS
 P06U625oBOGPiHJsm8IEhEB5yeYtFnwfipS54kVOorc+gy77bEExXqO4Fm7tg4okNxwNWDZ8B
 dQ52qgvv8XZtgi4VHSRSpYFpcgSI6XLtfQtB5UAQUF8JEn2VI1OQGaUvyT13pg16UjESOeRUf
 OzojmpkGs+g732OE4xbT1O9bXXvMFqXeamD+wXVo1kW4CfXAObFT+O6CbWrcfY3Ql7f2g6Yfj
 XkWdxJpEwn+irVgukNgoRl5hh9qadde/K4kR0/FUOBLxCbKIuOOcGziFE3jGs4jbLSwPZ23Rk
 Qr+lZ4nCrkfXvs4AZPIlH2YrmEhbE3QJennHUY8/tDzxYTceUaRUbzw3hVjfwo+rGSEoSpYcx
 ifFqZaZXwCOv/bJr6EDya+IhjzWGcJXdaoIrMPVjYZMY7koVCkbXd/Fxaizuewgd7WSVSqlNW
 QoD+0qwICEKUDr2otOxlJIpXyKltSKdK48NAwee7uCvYXz0YeV22Bfq7m2W17QI8ZXvXSxIpH
 Sfl0xqubW6Arw2jhT5ZyIlQDEN9Og9zAUd9tHb7B7SIw8I7fEvhraR9pgvbWjsMQbLLBn9pJh
 o4aKb0Ki7ucMl2gYSWsL0WvHZw3DjKNENEmHtjxyWmaReCxcYdSHMQGvQhXFPBsF3mLkyp1JR
 xvmbwPpVRk2smso79haadU+DNYy8lzpBQmuj+qYpE8T8qVHmwkrX04s/gP9b8uK76iKA0Jt8O
 RlBG8sdpPIMeft78Ir4RSLo8YBxLJwMmDXuCDQyYc+coV4mNHHZUFgT3dV/8jC8qbQTENEtTN
 20vzb61CrsTq5pfTTtgR6Yfj9nY9dfNx51drmFzBEPflmv7CVu5w8GH54NWqbm9hYF6SMLfnj
 sw75ud8HuIhVeI0DGfwslNumF+SVZklfeLvfNM7LJqpD3YT91sqf/KLsm1r/06GpTyaqQXYXD
 rLdBobHvDx0L0EKjtMV6B5g4u7e3WoyKQHuM+D6Zbe54bFqUsQebS6Y5VAaqiJPBbCbkrbyue
 W9fO0sR2651qfY=
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/1/21 11:44, Stephen Rothwell wrote:
> Commit
>   cad7eadf2afb ("parisc: Use swap() to swap values in setup_bootmem()")
> is missing a Signed-off-by from its committer.

Thanks, fixed now.

Helge

