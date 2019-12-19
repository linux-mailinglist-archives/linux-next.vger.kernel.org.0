Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75A7B126630
	for <lists+linux-next@lfdr.de>; Thu, 19 Dec 2019 16:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbfLSP4e (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Dec 2019 10:56:34 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:50528 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbfLSP4e (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Dec 2019 10:56:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=rjL7IN7Ds1hUfh0T2ILGQLcCmbkXt5wirx9kdENfl00=; b=UnQYZufnxzgPbRVfWvqiwp3VT
        Gq/U5zKQJ6Zy8alLY8Y78xJdR3TDX8kPJFQY9TE044lcc0E9dRPWXDPkccrRDsKa/h+aWs1VfPhT/
        Qe41rZNjF/hqqbFWRVgHS196s91l32U71Hmn6fHDzBKe5BccQbaP6Z1qTDm9zE8NA0hf5RQ0Rxsnd
        HUyMAQuctOqu4Kw2/kJPURqH7NC2F7Ui144xi8J2EM5/dj7TlEfC0Qec4vFUW4ed+zf11uXhx8DV8
        eQqDS1Fhg9A5IFLzuB5W51hRK3tZn4tZergh13JvOmOAs8h+vjYMmrfNgnYTgwROzCSdd5pKe1peo
        lx9Btsyng==;
Received: from [2601:1c0:6280:3f0::fee9]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1ihyAD-0004jp-MR; Thu, 19 Dec 2019 15:56:33 +0000
Subject: Re: linux-next: Tree for Dec 19 (f2fs)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-f2fs-devel@lists.sourceforge.net
References: <20191219181125.273d62b3@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5306838a-5f25-a2d3-6b2b-884f4287710a@infradead.org>
Date:   Thu, 19 Dec 2019 07:56:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191219181125.273d62b3@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/18/19 11:11 PM, Stephen Rothwell wrote:
> Hi all,
> 
> News: Tomorrow will be the last linux-next release until January 6
> (unless I get very bored :-)).
> 
> Changes since 20191218:
> 

on i386:

when f2fs is a loadable module:
ERROR: "__udivdi3" [fs/f2fs/f2fs.ko] undefined!

or when builtin:
ld: fs/f2fs/file.o: in function `f2fs_truncate_blocks':
file.c:(.text+0x7bf7): undefined reference to `__udivdi3'


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
