Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB63C115C65
	for <lists+linux-next@lfdr.de>; Sat,  7 Dec 2019 14:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbfLGN7R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sat, 7 Dec 2019 08:59:17 -0500
Received: from mga03.intel.com ([134.134.136.65]:46213 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726397AbfLGN7R (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sat, 7 Dec 2019 08:59:17 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Dec 2019 05:59:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,288,1571727600"; 
   d="scan'208";a="263850342"
Received: from bzhan21-mobl1.ccr.corp.intel.com ([10.255.31.241])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Dec 2019 05:59:14 -0800
Message-ID: <5c188e0fe73ba73c006f27b4540b8d9dbef4016c.camel@intel.com>
Subject: Re: linux-next: Signed-off-by missing for commit in the thermal tree
From:   Zhang Rui <rui.zhang@intel.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Sat, 07 Dec 2019 21:59:13 +0800
In-Reply-To: <20191207105536.6641fff9@canb.auug.org.au>
References: <20191207105536.6641fff9@canb.auug.org.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Sat, 2019-12-07 at 10:55 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   d6532afcabab ("MAINTAINERS: thermal: Change the git tree location")
>   e7738e756835 ("MAINTAINERS: thermal: Eduardo's email is bouncing")
>   f26ae7d94c8d ("thermal: power_allocator: Fix Kconfig warning")
> 
> are missing a Signed-off-by from their committers.
> 
Problem fixed.

thanks,
rui

