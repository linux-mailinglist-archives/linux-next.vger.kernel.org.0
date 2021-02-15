Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015B031C0BE
	for <lists+linux-next@lfdr.de>; Mon, 15 Feb 2021 18:38:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbhBORiL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 15 Feb 2021 12:38:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231660AbhBORg2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 15 Feb 2021 12:36:28 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A716C061574;
        Mon, 15 Feb 2021 09:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=WfBdv0XlEnpVSGZr2AxzwUYGmxRIbjsFvHnItDviNQ0=; b=QgwXQoDqR0KCo9Z7aDGKq5nnVP
        jExeJ5b00Lcjjj2InVNMrMEhTuqNu10gkVGIn4FDVZxnDpIOWj6MMg+psHP8TvJVqjNakMjrveHHF
        ScCocLAFsfUl1xgbgF18zD7Prb1A3hRrXGNR5nRxeuWtprzLJzQyEdULiKdITIk80FLiW5HN+1GvM
        Gf4P5G0cRieS6ha33tlZY3eDIQUjlAnkUvfwCHXWwRAOt5CU9j2JdaasmdFPaP85P89dmzWYmrvEB
        wjgWTJr24PxvmsDQ6ZqHkDv3C19NqZKLQY5iluwCScVZTCAtnBh/u4oxt3SASv2bUhwyb5jHoD4DQ
        lHMf78sQ==;
Received: from [2601:1c0:6280:3f0::6444]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1lBhmg-0006cD-T7; Mon, 15 Feb 2021 17:35:43 +0000
Subject: Re: linux-next: Tree for Feb 15 (CXL on i386)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Ben Widawsky <ben.widawsky@intel.com>,
        Dan Williams <dan.j.williams@intel.com>
References: <20210215203421.43cc2a4a@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f6121dec-1a65-bd25-03b7-bcaf22d0f3b2@infradead.org>
Date:   Mon, 15 Feb 2021 09:35:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210215203421.43cc2a4a@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 2/15/21 1:34 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20210212:
> 


CXL on i386 has these issue:

../drivers/cxl/mem.c:335:2: error: implicit declaration of function ‘writeq’; did you mean ‘writel’? [-Werror=implicit-function-declaration]
  writeq(cmd_reg, cxlm->mbox_regs + CXLDEV_MBOX_CMD_OFFSET);
  ^~~~~~

../drivers/cxl/mem.c:350:15: error: implicit declaration of function ‘readq’; did you mean ‘readl’? [-Werror=implicit-function-declaration]
  status_reg = readq(cxlm->mbox_regs + CXLDEV_MBOX_STATUS_OFFSET);


and lots of these (just one example here):

../drivers/cxl/cxl.h:29:47: note: in expansion of macro ‘GENMASK’
 #define   CXLDEV_MBOX_CMD_PAYLOAD_LENGTH_MASK GENMASK(36, 16)
                                               ^~~~~~~
../drivers/cxl/mem.c:329:25: note: in expansion of macro ‘CXLDEV_MBOX_CMD_PAYLOAD_LENGTH_MASK’
   cmd_reg |= FIELD_PREP(CXLDEV_MBOX_CMD_PAYLOAD_LENGTH_MASK,
                         ^
../include/linux/bits.h:36:11: warning: right shift count is negative [-Wshift-count-negative]
   (~UL(0) >> (BITS_PER_LONG - 1 - (h))))
           ^
../include/linux/bitfield.h:95:49: note: in definition of macro ‘FIELD_PREP’
   ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask); \
                                                 ^~~~~
../include/linux/bits.h:38:31: note: in expansion of macro ‘__GENMASK’
  (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
                               ^~~~~~~~~


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
