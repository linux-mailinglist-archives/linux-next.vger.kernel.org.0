Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A293F102833
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 16:38:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727682AbfKSPiH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 10:38:07 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:38290 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727505AbfKSPiG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Nov 2019 10:38:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=K+kVvT7tsBTbSnTMawe6RXRvGys013zzmPiihyV73Eg=; b=jw21mr9VbIGbwVBuUsJyltrrP
        7qAhno3zr5CTueQza+Ko8A8Jp06MN6AZDHmgrkNhQULmZt0MAAcpX84sX4MDcFj37i23OzHgPvq+f
        W+V5MgGFfbmAAxDEvoFUQVOegvmMaTRBJG5JvbIqgJIG4cs3FTQgeHVCk4RcX3C4VKhGL+CxLWxsN
        16kC0ihEjNAzoPonY/vnI9q77oqsu78dVMkesg+qUttKHO9KhVZsB32z8yQIlI9phVy5+6AENU8tx
        z0XJtzLCy+TxYHopDF/mIO51YTW3WBwmLtSxbhjUmfC+L+2dLEyWaOnHfj7hNT2AyDHPnkbZsROAm
        EUWRIkOWg==;
Received: from [2601:1c0:6280:3f0::5a22]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iX5Zs-0003nO-57; Tue, 19 Nov 2019 15:38:04 +0000
Subject: Re: linux-next: Tree for Nov 19 (objtool)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>
References: <20191119194658.39af50d0@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a5d9048b-2393-7a81-626f-c7aee8cf5730@infradead.org>
Date:   Tue, 19 Nov 2019 07:38:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191119194658.39af50d0@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/19/19 12:46 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20191118:
> 

on x86_64:

arch/x86/kernel/cpu/mce/core.o: warning: objtool: mce_timed_out()+0x23: unreachable instruction
kernel/exit.o: warning: objtool: __x64_sys_exit_group()+0x14: unreachable instruction  [known]
kernel/cred.o: warning: objtool: prepare_creds()+0xf0: unreachable instruction
samples/ftrace/ftrace-direct.o: warning: objtool: .text+0x0: unreachable instruction
samples/ftrace/ftrace-direct-too.o: warning: objtool: .text+0x0: unreachable instruction
samples/ftrace/ftrace-direct-modify.o: warning: objtool: .text+0x0: unreachable instruction


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
