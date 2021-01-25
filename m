Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61EE2302784
	for <lists+linux-next@lfdr.de>; Mon, 25 Jan 2021 17:12:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729914AbhAYQKz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 25 Jan 2021 11:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730610AbhAYQKc (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 25 Jan 2021 11:10:32 -0500
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD01BC061786
        for <linux-next@vger.kernel.org>; Mon, 25 Jan 2021 08:09:51 -0800 (PST)
Received: by mail-qt1-x834.google.com with SMTP id r9so9991192qtp.11
        for <linux-next@vger.kernel.org>; Mon, 25 Jan 2021 08:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q8bxUP4SZLC7pRMbVLxdU+OOQgW0ishf2aucQ47lV0g=;
        b=CSL31hCUQXPjH3ulEF0/gUF6JbaFvZ8v9/Q4qwzK142bF6wJZ841wdymvwRUMlVMSA
         9YV4h8k7ArrTGRwMH/650FwwfI+F0juz3IgcwA0LooUGNhJYYNpSHMaRwt5OZyDZWn7L
         xurgpX0TFeple36KrsmxypbJ3VCHrjEoaMXEmRhQsuZcuJwZ2O9SZsobmt1AyIl4Kc4I
         uD7AwGNsriyD52r7sn72OTLXLdjcOsdj2I/kou6TTLiwCmimLn00usup7f7x6s08rx8G
         S1esD7sHjj1dCQAhjTuzGlvzwKmqQ+JQZ/hwiGp0dBcyvaFwDH0Yh5RmXFIkU0W3B1za
         LQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q8bxUP4SZLC7pRMbVLxdU+OOQgW0ishf2aucQ47lV0g=;
        b=E5uQPS4Uhj+ilaB8aGaVOR41kBoN9UIyxFkwkX6gdjCex3MMo371CbcW2rKHng4gLu
         Nl22syWCG9El/hRle7+QFTHnunmQzfsu1dq4WyLkl8ydK2f/sPsgK128AnGjaSduvVvl
         WJiey+JZ9zbubzxBZirvWcTx1RC5lPEFjPE/QE58+wH3YcMF8HsFy+MbJHaWuzykKVr/
         JfcT9iaG0ajAWN1lS2wQ+ugQgrl9XRTnj888wptTVEm9pQ0826D71xMyGWSzWcqNT1lO
         haXBwc18ZGoGV5HR2C3MY8+2oN9zXM8s9M3yqHBUUdV0WVHuo0m7twjVqVbljcsfh0x7
         8d9g==
X-Gm-Message-State: AOAM531DliBF6E6MemGTUvXrR/PPUwGdqvHc347IjOX/fJSfixwwBKQk
        oepo809s5mn0/I1DzCxnUamvGijG5N95oIhB1o7Y+g==
X-Google-Smtp-Source: ABdhPJzBsfakB8gLLdz6SY+yyV1zer6olHzaJbEO7s+UAtcDNd57y1jVlnVklvpEFpZR85DtcJhRL6jiH3rPp3wM2OE=
X-Received: by 2002:ac8:5bc2:: with SMTP id b2mr1154243qtb.98.1611590990621;
 Mon, 25 Jan 2021 08:09:50 -0800 (PST)
MIME-Version: 1.0
References: <20210125111223.2540294c@canb.auug.org.au>
In-Reply-To: <20210125111223.2540294c@canb.auug.org.au>
From:   Stanislav Fomichev <sdf@google.com>
Date:   Mon, 25 Jan 2021 08:09:06 -0800
Message-ID: <CAKH8qBvQQxJLBRxEs8=Vq3CWLSr+m8V3Cwm0wgakLDcRHieYVg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the bpf-next tree with the net-next tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Daniel Borkmann <daniel@iogearbox.net>,
        Alexei Starovoitov <ast@kernel.org>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Arjun Roy <arjunroy@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Thanks, the merge resolution looks good to me!

On Sun, Jan 24, 2021 at 4:12 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the bpf-next tree got a conflict in:
>
>   net/ipv4/tcp.c
>
> between commit:
>
>   7eeba1706eba ("tcp: Add receive timestamp support for receive zerocopy.")
>
> from the net-next tree and commit:
>
>   9cacf81f8161 ("bpf: Remove extra lock_sock for TCP_ZEROCOPY_RECEIVE")
>
> from the bpf-next tree.
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
> diff --cc net/ipv4/tcp.c
> index e1a17c6b473c,26aa923cf522..000000000000
> --- a/net/ipv4/tcp.c
> +++ b/net/ipv4/tcp.c
> @@@ -4160,18 -4098,13 +4160,20 @@@ static int do_tcp_getsockopt(struct soc
>                 if (copy_from_user(&zc, optval, len))
>                         return -EFAULT;
>                 lock_sock(sk);
>  -              err = tcp_zerocopy_receive(sk, &zc);
>  +              err = tcp_zerocopy_receive(sk, &zc, &tss);
> +               err = BPF_CGROUP_RUN_PROG_GETSOCKOPT_KERN(sk, level, optname,
> +                                                         &zc, &len, err);
>                 release_sock(sk);
>  -              if (len >= offsetofend(struct tcp_zerocopy_receive, err))
>  -                      goto zerocopy_rcv_sk_err;
>  +              if (len >= offsetofend(struct tcp_zerocopy_receive, msg_flags))
>  +                      goto zerocopy_rcv_cmsg;
>                 switch (len) {
>  +              case offsetofend(struct tcp_zerocopy_receive, msg_flags):
>  +                      goto zerocopy_rcv_cmsg;
>  +              case offsetofend(struct tcp_zerocopy_receive, msg_controllen):
>  +              case offsetofend(struct tcp_zerocopy_receive, msg_control):
>  +              case offsetofend(struct tcp_zerocopy_receive, flags):
>  +              case offsetofend(struct tcp_zerocopy_receive, copybuf_len):
>  +              case offsetofend(struct tcp_zerocopy_receive, copybuf_address):
>                 case offsetofend(struct tcp_zerocopy_receive, err):
>                         goto zerocopy_rcv_sk_err;
>                 case offsetofend(struct tcp_zerocopy_receive, inq):
