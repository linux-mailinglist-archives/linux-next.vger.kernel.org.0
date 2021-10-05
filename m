Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD3DF42231D
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 12:10:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233738AbhJEKMV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Oct 2021 06:12:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:54910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233671AbhJEKMU (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 5 Oct 2021 06:12:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1511761247;
        Tue,  5 Oct 2021 10:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633428630;
        bh=4iWhdJ7s4eAjrOEDuZHxUg1f+avIITd37qcdykKBzII=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=tmeHwkOgCKJ6iCZWCHUG7XhijYqJEH9/wdhTMV0e71vNdgpi6uBqnhn1PNXab8Znw
         3CiL/tfetWhM5EZNyMTnXP9FHGS4F6zXlwjVx8S8GVWhPTcCblWobKz0sZm/R0O+CC
         edOEjMlhiLOi0v1zgQ9aoEOWW89SJRBZ5/BzNpWCY8n5uqgKQfAcFQaHL3kCSvdW/A
         oz8+yWDW5QD4iKYR/1z+rYm1aaaJyNDJ4AI3v7eFE4xEk46KTLh0BIauEnDr7Rd4Kc
         aW0Ob33YjBxlRIcwX7Xxpu61Se1wds/75tCUfLUSgAn+MZnuYlpaBdrmqfEZQecTJ+
         HG9LlXHmr0GXg==
Message-ID: <94f1ac147ba08e3d95fb74369c4f1482f0833ec4.camel@kernel.org>
Subject: Re: linux-next: build warning after merge of Linus' tree
From:   Jeff Layton <jlayton@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Date:   Tue, 05 Oct 2021 06:10:29 -0400
In-Reply-To: <20211005201851.38832f67@canb.auug.org.au>
References: <20211005201851.38832f67@canb.auug.org.au>
Content-Type: text/plain; charset="ISO-8859-15"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, 2021-10-05 at 20:18 +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In Linus' tree, today's linux-next build (htmldocs) produced this warning:
> 
> Documentation/filesystems/index.rst:18: WARNING: toctree contains reference to nonexisting document 'filesystems/mandatory-locking'
> 
> Introduced by commit
> 
>   f7e33bdbd6d1 ("fs: remove mandatory file locking support")
> 

Thanks Stephen.

I rolled up a patch to remove that line and put it in my locks-next
branch. It should end up in linux-next soon. I'll plan to send that on
to Linus for v5.16, unless anyone thinks it needs to go in sooner.
-- 
Jeff Layton <jlayton@kernel.org>

