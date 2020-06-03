Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8143C1ECD14
	for <lists+linux-next@lfdr.de>; Wed,  3 Jun 2020 12:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725888AbgFCKDM (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 3 Jun 2020 06:03:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:34620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725881AbgFCKDM (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 3 Jun 2020 06:03:12 -0400
Received: from devnote2 (p13154-mobac01.tokyo.ocn.ne.jp [153.233.4.154])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D34CD20734;
        Wed,  3 Jun 2020 10:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591178591;
        bh=OB7T5ZoRQxjYqEYTuavZTDV97mzAgryidXG5qdhMOqY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=X2FaVprgl1V90VWCBGuq9Y/voM82i4GS0+4ou6e8oFQeiUNT4fwARc1aQnbA+72rn
         cqNy3ifT9d5HshXP768tXdusORCtz8MlMRY5ZBr72Vhj8wAIgYEGZ6LVwhFFPyhzE5
         qyDg1fjl9Om2COw5ZrzRtkqUskS/N9BSeTlUZI+o=
Date:   Wed, 3 Jun 2020 19:03:06 +0900
From:   Masami Hiramatsu <mhiramat@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Shuah Khan <shuah@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 kselftest tree
Message-Id: <20200603190306.bd85ea37629210c8642f7bd7@kernel.org>
In-Reply-To: <20200603182901.63dfec97@canb.auug.org.au>
References: <20200603182901.63dfec97@canb.auug.org.au>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On Wed, 3 Jun 2020 18:29:01 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   tools/testing/selftests/sysctl/sysctl.sh
> 
> between commit:
> 
>   eee470e0739a ("selftests/sysctl: Fix to load test_sysctl module")
> 
> from the kselftest tree and patch:
> 
>   "tools/testing/selftests/sysctl/sysctl.sh: support CONFIG_TEST_SYSCTL=y"
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thank you for fixing this confliction, at least this fix looks good to me.
I think this (Vlatimil's patch) should be merged via Shuah's kselftest tree.

https://lkml.org/lkml/2020/4/27/921

This fix seems an independent fix.

Thank you,

> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc tools/testing/selftests/sysctl/sysctl.sh
> index c3459f9f2429,ce1eeea6f769..000000000000
> --- a/tools/testing/selftests/sysctl/sysctl.sh
> +++ b/tools/testing/selftests/sysctl/sysctl.sh
> @@@ -112,10 -122,9 +112,10 @@@ test_reqs(
>   
>   function load_req_mod()
>   {
> - 	if [ ! -d $DIR ]; then
> + 	if [ ! -d $DIR -a ! -d $SYSCTL ]; then
>   		if ! modprobe -q -n $TEST_DRIVER; then
> - 			echo "$0: module $TEST_DRIVER not found [SKIP]"
> + 			echo "$0: module $TEST_DRIVER not found and not built-in [SKIP]"
>  +			echo "You must set CONFIG_TEST_SYSCTL=m in your kernel" >&2
>   			exit $ksft_skip
>   		fi
>   		modprobe $TEST_DRIVER


-- 
Masami Hiramatsu <mhiramat@kernel.org>
