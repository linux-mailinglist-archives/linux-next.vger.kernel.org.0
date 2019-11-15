Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 239C5FE290
	for <lists+linux-next@lfdr.de>; Fri, 15 Nov 2019 17:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727833AbfKOQRu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 15 Nov 2019 11:17:50 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:43226 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727557AbfKOQRt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 15 Nov 2019 11:17:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3mV00l6B2GS4HhX43HLje0KVpGQvHZUvaXI9YSCtNRo=; b=HI7rLNA4WPBSlnzlUg3+K6V4G
        FG+6Ov35hFW3DaIlzakIp+Tgb02+BiQnf4Wpry7Mp0+AhdnsviWuR0MZ6IwixjjPJGsRZ6d0NsVBO
        G455eTlT8JpCbBSxHKQ3iRBQAbyzx2iQIfTMWbwdphCVPhbJOLXVbwGvJ5wWvb592hOnHt2/WGs4L
        Y4jrqy9EIQovlVmSyVjCA0Q01fXgB4A8wi7vkR3DTG2fVN7Doe40jJog2jvecVSs7TyPmcIpKr8Uv
        gi+jTc6hp2uobScCGEiVOUSXZk+pf+zOO9j7kaKEMsRJoWl4uWyggpBxQ2kq1FEch+V5erhdgDDid
        coo9FPF+A==;
Received: from [2601:1c0:6280:3f0::5a22]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iVeI9-0002c4-2I; Fri, 15 Nov 2019 16:17:49 +0000
Subject: Re: linux-next: Tree for Nov 15 (drivers/md/dm-integrity)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Joe Thornber <dm-devel@redhat.com>
References: <20191115190525.77efdf6c@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <f368f431-b741-d04f-440b-3d8c3c035537@infradead.org>
Date:   Fri, 15 Nov 2019 08:17:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191115190525.77efdf6c@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 11/15/19 12:05 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20191114:
> 

on i386:

ld: drivers/md/dm-integrity.o: in function `calculate_device_limits':
dm-integrity.c:(.text.unlikely+0x1e9): undefined reference to `__udivdi3'


-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
