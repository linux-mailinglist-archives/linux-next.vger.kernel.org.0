Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D32D10D7CE
	for <lists+linux-next@lfdr.de>; Fri, 29 Nov 2019 16:20:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbfK2PUc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Nov 2019 10:20:32 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:49896 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726893AbfK2PUc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Nov 2019 10:20:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=XtJlgFt4mE4odW85XdnsO1s23lkqMRJqri3yb8lgmnE=; b=K7pqTdFs2tkCsUbWdrEJj+R1F
        mv+FlIwyeHsAxu36eUf9N5//X9wY4SMP/DbOtLv2fiGZkuJUFYmhzPcfUcMbiGf+7Ql/T2g36dwZZ
        NhjoZqbSRtiyoH8+tJxkbQYi94p/c/aW9GbSdzJ7ACjwyVjppoLk3IW/QqUrwat0hj55mpWMfn/MH
        5uxIQfR9zZWOSzym0lvndlkA1lbhSbl/0Sccy/wUd6cec8OkSZqMVTxCzLSmUJfgMplTfsBGHaCpn
        OLMXF2T5ycrdfV9Ki4mtRa9RYDwcuEXoZlbWlmgbi8E6ZNVkQ7U8rkJG38hCMny+8GBWofog7cHu/
        o7beLJ7HA==;
Received: from [2601:1c0:6280:3f0::5a22]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iai4N-0003iQ-NC; Fri, 29 Nov 2019 15:20:31 +0000
Subject: Re: linux-next: Tree for Nov 29 (objtool)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20191129152020.47767479@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <800550ea-4f1f-4712-68f6-7eb14f5caada@infradead.org>
Date:   Fri, 29 Nov 2019 07:20:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191129152020.47767479@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/28/19 8:20 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Please do not add any material for v5.6 to your linux-next included
> trees until after v5.5-rc1 has been released.
> 
> Changes since 20191128:
> 

on x86_64:

(new AFAIK)
fs/btrfs/extent_io.o: warning: objtool: __set_extent_bit()+0x2b7: unreachable instruction
drivers/atm/horizon.o: warning: objtool: interrupt_handler()+0x3c: unreachable instruction

samples/ftrace/ftrace-direct.o: warning: objtool: .text+0x0: unreachable instruction
samples/ftrace/ftrace-direct-too.o: warning: objtool: .text+0x0: unreachable instruction
samples/ftrace/ftrace-direct-modify.o: warning: objtool: .text+0x0: unreachable instruction

(old, known)
kernel/exit.o: warning: objtool: __x64_sys_exit_group()+0x14: unreachable instruction


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
