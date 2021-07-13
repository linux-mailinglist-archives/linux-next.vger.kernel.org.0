Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF113C6833
	for <lists+linux-next@lfdr.de>; Tue, 13 Jul 2021 03:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231775AbhGMBqt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Jul 2021 21:46:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230000AbhGMBqt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 12 Jul 2021 21:46:49 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6481C0613DD;
        Mon, 12 Jul 2021 18:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=ICoTc7qGk/1qypK83R7fGyJqAPnALmmKVsjr/dkGc+Q=; b=M1Rqr0RLVqpbPEqPc2Ps4vBBnJ
        18JxUFcfGOtJzwv4NeTZMGNXbt3AcqeipadAM2tPvFOhHi6EyISI9XYmOt/cflsCB7aKNHwErkjBa
        cadXJqRkjnfTrD4C9C1s66crLxH3qis2wMT5KsfbAAwmjSgrHlODTSFitKiCQM8mGBO2JHslhR+wU
        66Raibjlwz7qW/+th1df6Rqb52RTrOZ3SB0eoU+u1GHzzBtf72OBBMK92P1KtWA5H0dP1jguhVILN
        V7LjgLfTjBwxfDbVrMXKmUecIDh8ujwkPqtnoXMTKtz726XLUkLHPCfDn0PQMb/TkbMbcnMny021a
        KOS1X05Q==;
Received: from [2601:1c0:6280:3f0::aefb]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m37So-008tEe-Jp; Tue, 13 Jul 2021 01:43:58 +0000
Subject: Re: linux-next: Tree for Jul 12 (no Rust)
To:     Stephen Rothwell <sfr@rothwell.id.au>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>
References: <20210712120828.5c480cdc@canb.auug.org.au>
 <c47a7f0b-4b5a-30c3-ee1e-2973793a9534@infradead.org>
 <20210713111029.77bfb9bb@elm.ozlabs.ibm.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <56341950-abd6-8a9c-42ca-7eb91c55cc90@infradead.org>
Date:   Mon, 12 Jul 2021 18:43:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713111029.77bfb9bb@elm.ozlabs.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/12/21 6:10 PM, Stephen Rothwell wrote:
> Hi Randy,
> 
> On Mon, 12 Jul 2021 08:24:16 -0700 Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> I am getting no builds completing. I see this:
>>
>> Error: No compiler specified.
>> Usage:
>> 	../scripts/rust-version.sh <rust-command>
>> init/Kconfig:71: syntax error
>> init/Kconfig:70: invalid statement
>>
>> and then 'bc' running continuously until I kill it.
> 
> OK, this is weird.  init/Kconfig has not changed from Friday and I
> don't see these errors at all in my builds.  I also have no rust
> compiler installed.  And the kernel ci bot seems happy (well nothing
> like this anyway).
> 

Hm, OK, I'll check for patch/merge problems (since I am using
tarballs and patches).

thanks.
