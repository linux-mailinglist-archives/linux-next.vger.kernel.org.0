Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2B196D661A
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2019 17:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387517AbfJNPaD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Oct 2019 11:30:03 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:58862 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387515AbfJNPaD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Oct 2019 11:30:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=W51lL8Jtv2NG/exKYIb6hikzWtRX+qP9y7Uom+OcL0c=; b=JDycHWRT9WVmXuQwehUiAzPjY
        mEHlDQ1sVpgwq9Z/9YhLaOOpN5RQ5qCc1tbelHkwf7b3QNAMqUyxClMEa7aP1QkhRrcKYNXhxvZ9j
        D8YMFs45C3H/bpcIjWztYJFtpW1ndwLxk/3nasUSd2g4DI6rTJ9brT1xdh6merTuMZxuXGeri/qIW
        B4VWGlywkt3cDuJTHQcEp6bH784+mrTGmO83jNc6MJv2Qhxf4IY9156HlvFLTCAE/aJlB3DmxF1nF
        /WprKPaL2jT3CFt0Ux6wkvcNuzp8m0Jlw6yxpb6JNdGsOlfvfDva2LSOh2Gnmo/soNgn/LHwmv0t1
        o7yhPoVXw==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iK2IM-0008UT-RO; Mon, 14 Oct 2019 15:30:02 +0000
Subject: Re: linux-next: Tree for Oct 14 (insn_decoder_test)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Masami Hiramatsu <mhiramat@redhat.com>
References: <20191014174707.469f596f@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2d83682b-6206-4992-63cc-342d61641c0a@infradead.org>
Date:   Mon, 14 Oct 2019 08:30:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191014174707.469f596f@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/13/19 11:47 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20191011:
> 

on x86_64:

  HOSTCC  arch/x86/tools/insn_decoder_test
  HOSTCC  arch/x86/tools/insn_sanity
  TEST    posttest
arch/x86/tools/insn_decoder_test: warning: Found an x86 instruction decoder bug, please report this.
arch/x86/tools/insn_decoder_test: warning: ffffffff81000bf1:	f7 0b 00 01 08 00    	testl  $0x80100,(%rbx)
arch/x86/tools/insn_decoder_test: warning: objdump says 6 bytes, but insn_get_length() says 2
arch/x86/tools/insn_decoder_test: warning: Decoded and checked 11913894 instructions with 1 failures
  TEST    posttest
arch/x86/tools/insn_sanity: Success: decoded and checked 1000000 random instructions with 0 errors (seed:0x871ce29c)


-- 
~Randy
