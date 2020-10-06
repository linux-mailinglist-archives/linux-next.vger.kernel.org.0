Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDB7D2851ED
	for <lists+linux-next@lfdr.de>; Tue,  6 Oct 2020 20:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgJFSzE (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 6 Oct 2020 14:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgJFSzD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2020 14:55:03 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0425C061755;
        Tue,  6 Oct 2020 11:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=3CSVvQ2mzExkbUFinxZ2JkbxYx4ehHrxZW5yiP0pp9M=; b=wA6nTmnDhQsm/G/FE2zUm1McSV
        48Xv922pCwJGAorr8WDa+vRp58x1JOjq0aBGQ4YLAPks8x8ZXNKNHG/EWS0QfnFoK5gZO2QwU63nw
        Ic2GM9BnzS2zi7+A3CjrTYwnDlWOxer48r+4TcaGUWRiSFvJ0D/nl4PDo3inSqRcLDBXiPPwIRVyZ
        tliw0KUvxZa73t/Fp0Fsy89KDCQem4Ww2HGW5TZDHn5nh74Lq9EzLkNgHVl4fclwFg4e33uBTwADr
        c/9YrI0yBHN+v/TiRj/Dg9Fd92ruRJolfNzpKZGG6BvYypbGwS69VIefa7LwasuEP4a2c/6e/Y7C4
        WklhNZgw==;
Received: from [2601:1c0:6280:3f0::2c9a]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kPs6r-000530-6P; Tue, 06 Oct 2020 18:54:49 +0000
Subject: Re: linux-next: Tree for Oct 6 (sound/soc/intel/catpt/device.c)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <liam.r.girdwood@linux.intel.com>,
        Jie Yang <yang.jie@linux.intel.com>
References: <20201006231234.701591b5@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0d1072b7-c57c-6a50-0561-389ad6a3e414@infradead.org>
Date:   Tue, 6 Oct 2020 11:54:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201006231234.701591b5@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/6/20 5:12 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20201002:
> 

on x86_64 or i386:
when CONFIG_MODULES is not set/enabled:

../sound/soc/intel/catpt/device.c: In function ‘catpt_resume’:
../sound/soc/intel/catpt/device.c:84:7: error: implicit declaration of function ‘module_is_live’; did you mean ‘module_driver’? [-Werror=implicit-function-declaration]
  if (!module_is_live(dev->driver->owner)) {
       ^~~~~~~~~~~~~~
       module_driver


You could see
commit cdb685cb9158fa67f6f4584ea39279ed7ae39253
Author: Danil Kipnis <danil.kipnis@cloud.ionos.com>
Date:   Thu May 21 20:59:09 2020 +0200

    RDMA/rnbd: Fix compilation error when CONFIG_MODULES is disabled

for a possible fix.

-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
