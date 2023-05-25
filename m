Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA1D710854
	for <lists+linux-next@lfdr.de>; Thu, 25 May 2023 11:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240535AbjEYJIy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 May 2023 05:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240268AbjEYJIu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 May 2023 05:08:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8DA7A7
        for <linux-next@vger.kernel.org>; Thu, 25 May 2023 02:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685005683;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6WwAh9efRQwhFEyM9VU1DiBGgZp979/2Wr6u+IJz1Cc=;
        b=Wtgf0b0jv4MC5bVwfkFAAIGbICX+Jai4oteqY1k0ZeJ7m7xJ2Aa70+xC0DBxD1qkOocmCe
        oc+n9AcdGsgoeQM8gogZZidu3SUNlsdC7PirL0S+rQSAj5Mh/qXoX6idRZAhbowiUKT4Kb
        0rE+ewkmNzj6++2UpfFHoaufDWXXufY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-P3dfkBZ1PHeOH8RHdwJBXA-1; Thu, 25 May 2023 05:08:01 -0400
X-MC-Unique: P3dfkBZ1PHeOH8RHdwJBXA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f50aa22cd2so2391965e9.1
        for <linux-next@vger.kernel.org>; Thu, 25 May 2023 02:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685005680; x=1687597680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WwAh9efRQwhFEyM9VU1DiBGgZp979/2Wr6u+IJz1Cc=;
        b=gotpPXA9uj8xXh/Pv6tn/Aa5CcHxe4H0898wpS+np1hIIdujdsgVvQRYUXGlz4O371
         L3FBdJcfs8n8jy7A0pcia0OwDZvShv7Atv4GgaUjtv/9e2w5ZVgvkp3gztSCrvqXTUKz
         y8RMOV7eZlypBYYSmHwB4/Hy7TemYRa8UNSXwrYKd9e9k5QOQ7jsmzoHOs6FVgjyVUFX
         RPGQCyCWnTnUL8gmOltY4GKBymW4RPj3IMBsenUlj9jkxUMbFNXkNB3F/FF7SgpohM5U
         1Uw0Tzwhav1kB9rjIJ5a3TzQ4cNmqe5KQ+J+UmHhuwlXCCFglYq+LUMyLKKGM7Xd77mU
         m68w==
X-Gm-Message-State: AC+VfDzpgOniEBllHv2TQEde4WhtkA8pBujJMxMlqWBRSfqN+cOqSIHg
        H7f+9nvSiltHyrCZ30HncHoOmb+yaEzqCeEzXWiR1FDJeRiAdfCnbOPUQnXHztQi59njT5I/cGh
        YjY6uxQEIKV3LkcKNNI+4YQ==
X-Received: by 2002:a7b:cd07:0:b0:3f1:93c2:4df7 with SMTP id f7-20020a7bcd07000000b003f193c24df7mr1820111wmj.5.1685005680328;
        Thu, 25 May 2023 02:08:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7VLREfVW+AzWj+IROYw8A4Ui4eVr18eKssqhqm98Iw/1jx1C1ZkUaQzZXl6wwgUY1Yb/ypMA==
X-Received: by 2002:a7b:cd07:0:b0:3f1:93c2:4df7 with SMTP id f7-20020a7bcd07000000b003f193c24df7mr1820094wmj.5.1685005680060;
        Thu, 25 May 2023 02:08:00 -0700 (PDT)
Received: from debian (2a01cb058918ce004b671d3f9a8df89e.ipv6.abo.wanadoo.fr. [2a01:cb05:8918:ce00:4b67:1d3f:9a8d:f89e])
        by smtp.gmail.com with ESMTPSA id m23-20020a7bca57000000b003f5ffba9ae1sm1400286wml.24.2023.05.25.02.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 02:07:59 -0700 (PDT)
Date:   Thu, 25 May 2023 11:07:57 +0200
From:   Guillaume Nault <gnault@redhat.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>
Subject: Re: linux-next: manual merge of the net-next tree with the net tree
Message-ID: <ZG8lbabbUTko/ZpF@debian>
References: <20230525110037.2b532b83@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230525110037.2b532b83@canb.auug.org.au>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, May 25, 2023 at 11:00:37AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the net-next tree got a conflict in:
> 
>   net/ipv4/raw.c
> 
> between commit:
> 
>   3632679d9e4f ("ipv{4,6}/raw: fix output xfrm lookup wrt protocol")
> 
> from the net tree and commit:
> 
>   c85be08fc4fa ("raw: Stop using RTO_ONLINK.")
> 
> from the net-next tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc net/ipv4/raw.c
> index eadf1c9ef7e4,8b7b5c842bdd..000000000000
> --- a/net/ipv4/raw.c
> +++ b/net/ipv4/raw.c
> @@@ -600,9 -596,8 +599,8 @@@ static int raw_sendmsg(struct sock *sk
>   		}
>   	}
>   
> - 	flowi4_init_output(&fl4, ipc.oif, ipc.sockc.mark, tos,
> - 			   RT_SCOPE_UNIVERSE,
> + 	flowi4_init_output(&fl4, ipc.oif, ipc.sockc.mark, tos, scope,
>  -			   hdrincl ? IPPROTO_RAW : sk->sk_protocol,
>  +			   hdrincl ? ipc.protocol : sk->sk_protocol,
>   			   inet_sk_flowi_flags(sk) |
>   			    (hdrincl ? FLOWI_FLAG_KNOWN_NH : 0),
>   			   daddr, saddr, 0, 0, sk->sk_uid);

Looks good. Thanks!

