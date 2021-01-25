Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 324D23047B7
	for <lists+linux-next@lfdr.de>; Tue, 26 Jan 2021 20:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728165AbhAZF6A (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 Jan 2021 00:58:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:41906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727021AbhAYJq0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 25 Jan 2021 04:46:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE6D922D57;
        Mon, 25 Jan 2021 09:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611567880;
        bh=u6boge7fxbWaIkvX2C8PHSGb3b9pegYZfrTBtvLYU1s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=K0nfHg8qMuF2HQM7LNCOmVD0+W2bhl+oEPxwXcvm6WPe1/sqgwCPfl7qbGi44q++W
         CKRkYPTHQP5vaYBx3pXehhmYv7hNXwF/wbKDn0Vr12J3ZMoMrWYKMPmLFTa2jbUFbV
         wEG/sQ9YOa0Uu2Z2MEx1Rxxb41YrlM1OwBwmf2V4wSpHSA395SDOTV948bn6crOC1P
         woOqPaiRhB6Oz70DZ2BIfAuuRLC2WHAN2inq/gFKuWbyfOEDDZaeQxucB5UUbfzwU2
         8bP+RqdyPs0PA3YXZmz8/18qP8/0T0rsOU0Yy2QTMFYOqLgDfPEwQci4wKXCXkdiXA
         jj5XhWvD2WMNg==
Received: by mail-ot1-f42.google.com with SMTP id h14so12164756otr.4;
        Mon, 25 Jan 2021 01:44:39 -0800 (PST)
X-Gm-Message-State: AOAM531MfIoGrxqg6gheix6Gp9h4kyi5Kiw68sPjb8zFhp8yfwpfAb7l
        rtZNVJZwWVkzb9Ua9cIsQZWQTPzfzhVkn8dYnkg=
X-Google-Smtp-Source: ABdhPJx5bK63LxQdSz83vvgGvjc6te6I6zTut9vNIMSPOcLt0olx7YgMNrNj2+6Kv3w4X2taztS/GS3pOQU3GhUs5II=
X-Received: by 2002:a9d:3bb7:: with SMTP id k52mr124882otc.251.1611567878981;
 Mon, 25 Jan 2021 01:44:38 -0800 (PST)
MIME-Version: 1.0
References: <20210125091256.302fd411@canb.auug.org.au>
In-Reply-To: <20210125091256.302fd411@canb.auug.org.au>
From:   Arnd Bergmann <arnd@kernel.org>
Date:   Mon, 25 Jan 2021 10:44:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0QSicc8kQbdCnBUxcCfYDxe6rTLuijstOqpiTkwf3cSw@mail.gmail.com>
Message-ID: <CAK8P3a0QSicc8kQbdCnBUxcCfYDxe6rTLuijstOqpiTkwf3cSw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the risc-v tree with the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Palmer Dabbelt <palmerdabbelt@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sun, Jan 24, 2021 at 11:14 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Looks good, thanks!

      Arnd
