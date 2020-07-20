Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82637226B7B
	for <lists+linux-next@lfdr.de>; Mon, 20 Jul 2020 18:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732471AbgGTQlS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 20 Jul 2020 12:41:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731196AbgGTQlR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 20 Jul 2020 12:41:17 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBFE2C061794;
        Mon, 20 Jul 2020 09:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=vIy+LTW5jYYBV4hfqVnhhtl8us5VhtAtJu0nO6I1cmE=; b=zaXxxhUwzfepAs+QKhex2X36fE
        DuGzdqN4ZfvkT7AKp2dhrmQcXq3vupumdc9035lGjEKd5Go59nUEwulRTxU8Trpb/Ex3nsuM2YqRV
        D4I5n7Dn2fB5WtStJHI3ygoGBDaJ4OkixvGAC49N6P/2HqrpJnIQiqfzUBDxTauDaNA7JR7QsRkFs
        ntz+Lasmq+m+5tdKvnM5Ill/Tzzu4mroMqdF0sqp9EWd27QCQqkaGa4bsWrwJXLk+g0vAFME87GWW
        KkVHf6BzkLee7//0dkWecbqpW92OMBV1MC39ZmdYB0dCq/nq/hk3r5VxQMe3y/9ag4u5zbyyZcLwH
        ke/1Zf/g==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jxYqn-0005vn-4l; Mon, 20 Jul 2020 16:41:13 +0000
Subject: Re: linux-next: Tree for Jul 20 (scsi/ufs/exynos)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        Santosh Yaraganavi <santosh.sy@samsung.com>,
        Vinayak Holikatti <h.vinayak@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Seungwon Jeon <essuuj@gmail.com>
References: <20200720194225.17de9962@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <e6112633-61c9-fa80-8479-fe90bb360868@infradead.org>
Date:   Mon, 20 Jul 2020 09:41:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720194225.17de9962@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 7/20/20 2:42 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20200717:
> 

on x86_64:

WARNING: unmet direct dependencies detected for PHY_SAMSUNG_UFS
  Depends on [n]: OF [=n] && (ARCH_EXYNOS || COMPILE_TEST [=y])
  Selected by [y]:
  - SCSI_UFS_EXYNOS [=y] && SCSI_LOWLEVEL [=y] && SCSI [=y] && SCSI_UFSHCD_PLATFORM [=y] && (ARCH_EXYNOS || COMPILE_TEST [=y])


There are no build errors since <linux/of.h> provides stubs for
functions when CONFIG_OF is not enabled.

But new warnings are not OK.

thanks.
-- 
~Randy
Reported-by: Randy Dunlap <rdunlap@infradead.org>
