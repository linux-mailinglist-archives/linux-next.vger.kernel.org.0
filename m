Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DEDD1E26E2
	for <lists+linux-next@lfdr.de>; Tue, 26 May 2020 18:24:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388654AbgEZQY2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 26 May 2020 12:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388622AbgEZQY1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 26 May 2020 12:24:27 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B91B0C03E96D;
        Tue, 26 May 2020 09:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=gnmIhXzB3RNvlQEJxudMyqvgPQKTGzXQlEacv2B2e0g=; b=RhNZqRw7q2mgnUHaZUvCXscLVU
        pT7EPCptP2J+hNAzDWoY9HDyJbFOsROZl8G8kz6WfKvjTgCCxc1GBCOaZnKsHJynGPL8hQKQPBG1j
        Fr1UVoIULpOBnwMm0Vnqcuacw5ZqKJ1X6JhYj0sx4FpDZpx9J0IihCKCmwffZ6HXD/dESp1sYZALg
        nY6O7AoBKAG1nXrPcDltMfMNoWaCYU8VSCPVE6RxRjXcD4pVG4sMp4RIPjSdtlskhTGpBBGyR0a+t
        +JfU5Ds7vthC9JE+gz3Myvq3Tua2e7frHsG5x+fAmKtjlFgj/XoITxHB5ZRWOnetEFNeihelMLzXa
        GfpNJGgw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jdcNO-0003gE-LN; Tue, 26 May 2020 16:24:26 +0000
Subject: Re: linux-next: Tree for May 26 (hwmon/amd_energy.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Naveen Krishna Chatradhi <nchatrad@amd.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <20200526203932.732df7c6@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f050c447-18fa-50d0-dbdd-b60820dc7ba1@infradead.org>
Date:   Tue, 26 May 2020 09:24:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200526203932.732df7c6@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/26/20 3:39 AM, Stephen Rothwell wrote:
> Hi all,
> 
> News: there will be no linux-next release tomorrow.
> 
> Changes since 20200525:
> 

Hi,

All of my drivers/hwmon/amd_energy.c builds are failing (on i386 or x86_64).


$ gcc --version
gcc (SUSE Linux) 7.5.0


  CC      drivers/hwmon/amd_energy.o
In file included from ../arch/x86/include/asm/cpumask.h:5:0,
                 from ../arch/x86/include/asm/msr.h:11,
                 from ../arch/x86/include/asm/processor.h:22,
                 from ../arch/x86/include/asm/cpu_device_id.h:16,
                 from ../drivers/hwmon/amd_energy.c:6:
../drivers/hwmon/amd_energy.c: In function 'amd_energy_read':
../include/asm-generic/topology.h:51:36: error: void value not ignored as it ought to be
     #define cpumask_of_node(node) ((void)node, cpu_online_mask)
../include/linux/cpumask.h:618:72: note: in definition of macro 'cpumask_first_and'
 #define cpumask_first_and(src1p, src2p) cpumask_next_and(-1, (src1p), (src2p))
                                                                        ^~~~~
../drivers/hwmon/amd_energy.c:194:6: note: in expansion of macro 'cpumask_of_node'
      cpumask_of_node
      ^~~~~~~~~~~~~~~
../include/asm-generic/topology.h:51:46: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     #define cpumask_of_node(node) ((void)node, cpu_online_mask)
                                              ^
../include/linux/cpumask.h:618:72: note: in definition of macro 'cpumask_first_and'
 #define cpumask_first_and(src1p, src2p) cpumask_next_and(-1, (src1p), (src2p))
                                                                        ^~~~~
../drivers/hwmon/amd_energy.c:194:6: note: in expansion of macro 'cpumask_of_node'
      cpumask_of_node
      ^~~~~~~~~~~~~~~


thanks.
-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
