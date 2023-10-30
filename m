Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 736C87DB8EA
	for <lists+linux-next@lfdr.de>; Mon, 30 Oct 2023 12:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232294AbjJ3L2K (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Oct 2023 07:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232941AbjJ3L2J (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 30 Oct 2023 07:28:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A944DB3
        for <linux-next@vger.kernel.org>; Mon, 30 Oct 2023 04:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698665242;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
        bh=bsiUeVflfDVvAmeVY6x5W9Hj7ij+usCTK+hwkN4FBgE=;
        b=E3URgsnoJyX9nIJJWWOlHTf913++sQWwxKIJT8p1m6H9NyP5w9ErCMHgG+h6YHNRVfYW7w
        fkK5t7miIlIh1KRNw9zyNQFYN+Co1/ze5YAXIXRtk/HhOdAfdSYnKIDdC1qChSk/52ujTe
        znn4V8pfFLtQfvDojIjqJqp7kh74unc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-D5z5AoKDMSKMSEK_m6Zcxw-1; Mon, 30 Oct 2023 07:27:11 -0400
X-MC-Unique: D5z5AoKDMSKMSEK_m6Zcxw-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-32da39f7f2bso2123031f8f.0
        for <linux-next@vger.kernel.org>; Mon, 30 Oct 2023 04:27:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698665230; x=1699270030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsiUeVflfDVvAmeVY6x5W9Hj7ij+usCTK+hwkN4FBgE=;
        b=C79nT6QDM2Lvd7t81/TbFaJkqGVEAU8PgpQ6RZDyth+4js08Ps67Ws+mDv0coLJOoI
         R3ckhcXOc1hEtTzwwSjeIKizt+lSQDMfXZPyP2oadMti/iCTexKYwoUA8iUVQPhckHau
         kYOTa2CEhVNVc8oAhaVC7BTENYWqAGm5K5MSa+pgkbVT4Ss7du3aZ2ymtccvLnW6xA5V
         PLu6QdqSAEzhn+1StQYc07bQrqpJ32jlmgCHU1QLtv9eILjo6BpFhYdrSoocRnjI97hO
         gTkxMTsCZJp9JlPbHt20r2eQ4LhjxGZIQeH716HS0XSldjGto1wkXmyK3in3/hlHzNS1
         4mwA==
X-Gm-Message-State: AOJu0YzOU+6xFxVXhWQFfsftmh8vaysBgGkH7GtfHl8BbCdLxKszJzL/
        PU+VdhJ+HzEwIw3qOcdDq8NpDCawp2ZBSc6WotWVbz7QN3BavifX+Iy8ujENVp9W4XhPHat0yUk
        oOT2kuII7XpKeDMrqQ0WUTA==
X-Received: by 2002:adf:e94d:0:b0:32d:857c:d51d with SMTP id m13-20020adfe94d000000b0032d857cd51dmr6801186wrn.60.1698665230252;
        Mon, 30 Oct 2023 04:27:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwPR5Ky0Zsz4Ewu1UsV9OwmoJs5riShSCPj1bsmLTCUJ4UyfvG44yDX2LNCh32jYjTMqEkig==
X-Received: by 2002:adf:e94d:0:b0:32d:857c:d51d with SMTP id m13-20020adfe94d000000b0032d857cd51dmr6801171wrn.60.1698665229940;
        Mon, 30 Oct 2023 04:27:09 -0700 (PDT)
Received: from [192.168.1.174] ([151.81.68.207])
        by smtp.googlemail.com with ESMTPSA id d12-20020adffd8c000000b003143c9beeaesm7988756wrr.44.2023.10.30.04.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Oct 2023 04:27:09 -0700 (PDT)
Message-ID: <3ed75fa4-6b49-4fd2-a907-8619ca19a8b8@redhat.com>
Date:   Mon, 30 Oct 2023 12:27:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the kvm-x86 tree
Content-Language: en-US
To:     Christian Brauner <brauner@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Sean Christopherson <seanjc@google.com>
Cc:     Ackerley Tng <ackerleytng@google.com>,
        Chao Peng <chao.p.peng@linux.intel.com>,
        Isaku Yamahata <isaku.yamahata@intel.com>,
        "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
        Michael Roth <michael.roth@amd.com>,
        Yu Zhang <yu.c.zhang@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20231030134806.24510492@canb.auug.org.au>
 <20231030-ignorant-liebschaft-6d603ab43494@brauner>
From:   Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20231030-ignorant-liebschaft-6d603ab43494@brauner>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/30/23 11:05, Christian Brauner wrote:
> 
> @Paolo and @Sean, does that make sense and is the series for v6.7 or
> just already in -next for v6.8?

It's for 6.8.  Thanks for the fixup!

Paolo

> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 94bc478c26f3..a4c194b0b22c 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -272,17 +272,7 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
> 
>  static struct file *kvm_gmem_get_file(struct kvm_memory_slot *slot)
>  {
> -       struct file *file;
> -
> -       rcu_read_lock();
> -
> -       file = rcu_dereference(slot->gmem.file);
> -       if (file && !get_file_rcu(file))
> -               file = NULL;
> -
> -       rcu_read_unlock();
> -
> -       return file;
> +       return get_file_active(&slot->gmem.file);
>  }
> 
>  static struct file_operations kvm_gmem_fops = {
> 

