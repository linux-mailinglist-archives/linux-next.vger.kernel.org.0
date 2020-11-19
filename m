Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6564F2B8FA3
	for <lists+linux-next@lfdr.de>; Thu, 19 Nov 2020 11:00:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727098AbgKSJ6B (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 19 Nov 2020 04:58:01 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:33640 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726695AbgKSJ6B (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 19 Nov 2020 04:58:01 -0500
Received: from [95.90.240.160] (helo=wittgenstein)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <christian.brauner@ubuntu.com>)
        id 1kfghS-0002ik-Kn; Thu, 19 Nov 2020 09:57:58 +0000
Date:   Thu, 19 Nov 2020 10:57:58 +0100
From:   Christian Brauner <christian.brauner@ubuntu.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Christian Brauner <christian@brauner.io>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the pidfd-fixes
 tree
Message-ID: <20201119095758.gewmufudzsaqelg5@wittgenstein>
References: <20201119073400.6b209bd0@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201119073400.6b209bd0@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Nov 19, 2020 at 07:34:00AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   59b617b192f5 ("nsproxy: use put_nsproxy() in switch_task_namespaces()")
> 
> is missing a Signed-off-by from its committer.

Thanks for reporting this. This is now fixed.
Christian
