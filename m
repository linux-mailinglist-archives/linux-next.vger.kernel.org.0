Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC3FC7D5F05
	for <lists+linux-next@lfdr.de>; Wed, 25 Oct 2023 02:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344725AbjJYAWv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 24 Oct 2023 20:22:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344718AbjJYAWu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 24 Oct 2023 20:22:50 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA7A2118;
        Tue, 24 Oct 2023 17:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=In-Reply-To:From:References:Cc:To:
        Subject:MIME-Version:Date:Message-ID:Content-Type:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=0kGDhuK6X9gWNG6cI4X+JTJtBSw4oIbrgUi79dbupAo=; b=qhOzhI6/BO+Ic/qqGRnfypzA+x
        ZZrCohdZLEf0IQwsRUfr/lvKpNwkzL+T6G4wOXcbzE6g+kShl3doGd8+MqSsePpP8jHdtkK0mREJU
        aGHTka3sYjMiTcl5t5hW9qhbkALADMklVw6F+elWjz2sZnNbRF2lAlp1IjlkT4HT+UKAuuYCMz4sM
        vQGVEEa37qyl58J9xKuyL1YebyznulJ6GIEwZ1N2tUR5QQXcwFMq4jKEynpBPH9kZm/BqWMdf0frf
        dBfKYNwrdn1A+JC+E4Oak8qpS4Zl+bzmQ2gIQI26wANeJntEXo0p3slpPSh8m9jxLtAdIFHaYghXb
        2vcSNebQ==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1qvRfZ-00B4ht-1Q;
        Wed, 25 Oct 2023 00:22:45 +0000
Content-Type: multipart/mixed; boundary="------------PzoSsrzL2d0oS1fC0rnoWD7W"
Message-ID: <31264b8b-4509-4972-97f8-0926bc843147@infradead.org>
Date:   Tue, 24 Oct 2023 17:22:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Oct 24 (drivers/soc/renesas/Kconfig)
Content-Language: en-US
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20231024174818.1137914a@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231024174818.1137914a@canb.auug.org.au>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

This is a multi-part message in MIME format.
--------------PzoSsrzL2d0oS1fC0rnoWD7W
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/23/23 23:48, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20231023:


WARNING: unmet direct dependencies detected for DMA_GLOBAL_POOL
  Depends on [n]: !ARCH_HAS_DMA_SET_UNCACHED [=n] && !DMA_DIRECT_REMAP [=y]
  Selected by [y]:
  - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y] && RISCV_ALTERNATIVE [=y] && RISCV_SBI [=y]


Full randconfig file is attached.

-- 
~Randy
--------------PzoSsrzL2d0oS1fC0rnoWD7W
Content-Type: application/gzip; name="config-r9489.gz"
Content-Disposition: attachment; filename="config-r9489.gz"
Content-Transfer-Encoding: base64

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

--------------PzoSsrzL2d0oS1fC0rnoWD7W--
