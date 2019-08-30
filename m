Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7B1FA3CA3
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2019 18:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbfH3QwS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 30 Aug 2019 12:52:18 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53530 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727883AbfH3QwS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 30 Aug 2019 12:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=7a+XCsiuXXCRR1Y2/qK9IVAIAgqTUuDihw3bfaNlQgE=; b=mteAUakXTj9/LbVuXP+4pW3nT
        jBtwOjqFjNwLGwxgJ1uNHOFTM4deOUCfe+LBYq3uX9t1Rxp1z9KDX5CcrdgrsI5/WNmg4FMQ/8FsG
        E5Sw542kisDnh4B5EePaqh6vIIzjYCRpC/EH7vu+e13ND0Ds6bbFJ3AKrn0ynlAh/Yr3CLxHyEFLt
        VEE5MocBM4bGPCp49PijEuVeEKA2wf0YRNjViOG3F/HAs1wUhzFCKRW8mIV+BxlA/WANxD0QWhINJ
        oejEubgTPnjxFOXenn0dRH233xmjsgENr27xjoNcHW9HD3BxAzvJousVPoxEvQYBrerTk8TsVh/iE
        LA5gnXk1w==;
Received: from [2601:1c0:6200:6e8::4f71]
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i3k8G-0002Tr-KG; Fri, 30 Aug 2019 16:52:16 +0000
Subject: Re: linux-next: Tree for Aug 30 (exfat)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Valdis Kletnieks <valdis.kletnieks@vt.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20190831003613.7540b2d7@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <8ef40504-ba29-5325-9cb6-0c800a7b03ce@infradead.org>
Date:   Fri, 30 Aug 2019 09:52:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190831003613.7540b2d7@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 8/30/19 7:36 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20190829:
> 

on x86_64:
when CONFIG_VFAT_FS is not set/enabled:

../drivers/staging/exfat/exfat_super.c:46:41: error: ‘CONFIG_FAT_DEFAULT_IOCHARSET’ undeclared here (not in a function); did you mean ‘CONFIG_EXFAT_DEFAULT_IOCHARSET’?
 static char exfat_default_iocharset[] = CONFIG_FAT_DEFAULT_IOCHARSET;
                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                                         CONFIG_EXFAT_DEFAULT_IOCHARSET



-- 
~Randy
