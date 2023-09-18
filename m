Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F17397A3F36
	for <lists+linux-next@lfdr.de>; Mon, 18 Sep 2023 03:29:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbjIRB3K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 17 Sep 2023 21:29:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235113AbjIRB3D (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 17 Sep 2023 21:29:03 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A04C0119
        for <linux-next@vger.kernel.org>; Sun, 17 Sep 2023 18:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695000492;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CXfZQM0uVXNfHiLNlxxGdc5uA6LuWXlMtcyORQY/GI4=;
        b=QOk9s1rqhFc+fn5PmmY6OK/c1o88gPteqSkGe8Ww14X/DqyfDd4ll7BR3Z0+c4vFX3juxq
        Zrc+YeIlCQZuwfFn9OnHThDVdJNKydX5TByUN84XoRzU4HzxR1Yu++GJ9uKgUY8gIcHCUF
        NfIBQNv/d5AAkS60fgsIuV0/jjm7gGc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-686-Dr8hJNEdPniUdnmgqm16NA-1; Sun, 17 Sep 2023 21:28:07 -0400
X-MC-Unique: Dr8hJNEdPniUdnmgqm16NA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F22C811E7B;
        Mon, 18 Sep 2023 01:28:07 +0000 (UTC)
Received: from localhost (unknown [10.72.113.32])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FD5740C2064;
        Mon, 18 Sep 2023 01:28:05 +0000 (UTC)
Date:   Mon, 18 Sep 2023 09:28:02 +0800
From:   Baoquan He <bhe@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the asm-generic tree with the mm tree
Message-ID: <ZQenotf1QIHxovor@MiWiFi-R3L-srv>
References: <20230918101027.7506b71e@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918101027.7506b71e@canb.auug.org.au>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 09/18/23 at 10:10am, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the asm-generic tree got a conflict in:
> 
>   arch/ia64/kernel/setup.c
> 
> between commit:
> 
>   52f40d9a3c11 ("crash_core: change the prototype of function parse_crashkernel()")

Thanks a lot for fixing the conflict. I rebased the crash_core
refactoring code on linus's tree, so didn't notice ia64 arch has been
removed in next tree.

> 
> from the mm tree and commit:
> 
>   cf8e8658100d ("arch: Remove Itanium (IA-64) architecture")
> 
> from the asm-generic tree.
> 
> I fixed it up (I removed the file) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell


