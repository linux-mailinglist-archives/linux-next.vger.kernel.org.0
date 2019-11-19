Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C246F1027BC
	for <lists+linux-next@lfdr.de>; Tue, 19 Nov 2019 16:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbfKSPLY (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 19 Nov 2019 10:11:24 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:58690 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbfKSPLX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 19 Nov 2019 10:11:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=Tlv1z9IApTP7G1WMZKmi4nhZt6ESnPxSYnU0GkdrTBw=; b=tS+FH6uPjypW8JbonUzPq8uSs
        kep4qHtNkWyJs37reZ7aCG1cj6DafB7WaCbvO/P3M7cfufIa6FcUAGuFdG/i6UsnNdIE3SVgtgJou
        5wL8SLD/QGGvHfOCJwNdFAW1PB8KiL39AaGWyQjOVt3j3dzHG4UxFZFMojxMK+3SZ4VHIiOlam5Bg
        Y8ncrqb7JDVGiQumireDmwYEdstSulIA3NyzKoZqmbrAKxyNv+P9pOtO0ov80/pIxKIa8nfhKhvW2
        MSakneHqCn55Ud6Ho+CqkEpAHKQtsT++B0MrxvMFp2rkx/v5u4A2vTMQqQYYsI7BHlleYRdRfZviF
        5Esj1lxSQ==;
Received: from [2601:1c0:6280:3f0::5a22]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iX5A2-00030H-7p; Tue, 19 Nov 2019 15:11:22 +0000
Subject: Re: linux-next: Tree for Nov 19 (kcsan)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        kasan-dev@googlegroups.com, Dmitry Vyukov <dvyukov@google.com>,
        Marco Elver <elver@google.com>
References: <20191119194658.39af50d0@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e75be639-110a-c615-3ec7-a107318b7746@infradead.org>
Date:   Tue, 19 Nov 2019 07:11:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191119194658.39af50d0@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

It seems that this function can already be known by the compiler as a
builtin:

../kernel/kcsan/core.c:619:6: warning: conflicting types for built-in function ‘__tsan_func_exit’ [-Wbuiltin-declaration-mismatch]
 void __tsan_func_exit(void)
      ^~~~~~~~~~~~~~~~


$ gcc --version
gcc (SUSE Linux) 7.4.1 20190905 [gcc-7-branch revision 275407]

-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
