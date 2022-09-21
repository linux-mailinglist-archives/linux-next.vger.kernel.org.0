Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E04D45E54A5
	for <lists+linux-next@lfdr.de>; Wed, 21 Sep 2022 22:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229566AbiIUUnt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 21 Sep 2022 16:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiIUUns (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 21 Sep 2022 16:43:48 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF3659AFD6
        for <linux-next@vger.kernel.org>; Wed, 21 Sep 2022 13:43:47 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id s206so7112557pgs.3
        for <linux-next@vger.kernel.org>; Wed, 21 Sep 2022 13:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=+9OaKKw+f5Eb96ZFTHe9X6aWN64IeJY6epSMS2pCfKg=;
        b=aBWMDGVO2EuQ0pdfIdwdY8oYkulZhFSs1PL1d4P8AY5mPTBI8OV5JY+hVPJHeKyq8A
         ja7ykzgew4FgnoP7ny3CiwFn3BbQAN0naurK7Zk48MBZgkFp0+51sQd/XazRn4/AszYm
         GMjevlr3QFhm8MNG/Cox/7tr5MNBN3DCvIA7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=+9OaKKw+f5Eb96ZFTHe9X6aWN64IeJY6epSMS2pCfKg=;
        b=bY7iKXkfFsRtb5eRDpzqgMcJXWfBu1rqHbe+Cqf69Skokgb0I8/57BRiIN0w21Gsxr
         zj8sNFZhurDsbIRhXrJc0F+zpv5SN8wluRZKJG3uYEzjGNosxt54SWhWxqnKzcDVXrx7
         BjEYQLEkTCJ4wmDfHfjhlMTwGCJPegvggL870V10Xm+DEuLUe+dF7f7TotHUKIJk+Rtv
         C3wdj0lz46QMgqM2/g3TPayvL9fqBeld/EVkfpSskVu7GT8RwZQuVGNyMEYVZ04uv11O
         hMZx6KAZSkg9uZVb2Nc3f5tndbyGR7Ja22SXp13UzbdCJs4q+JHWIC3ApAwyP34erLoH
         OKjg==
X-Gm-Message-State: ACrzQf3EqU7GEYNnrkmJ9aRryxCgrRcc8lKyoAcu52kV46hNlEeSIu4K
        m7SKQE3UdtHoevJGKIxKEwPvpg==
X-Google-Smtp-Source: AMsMyM43TlaD1mWxHHmwOSc7yEy5vOkmXTWjVDTlRTL7yKd9eijaZT1RzwWyUheoSsg4a3VxxSFFxg==
X-Received: by 2002:a63:d456:0:b0:43b:f4a3:81b5 with SMTP id i22-20020a63d456000000b0043bf4a381b5mr32659pgj.200.1663793027111;
        Wed, 21 Sep 2022 13:43:47 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q59-20020a17090a4fc100b001fd7fe7d369sm2259843pjh.54.2022.09.21.13.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 13:43:46 -0700 (PDT)
Date:   Wed, 21 Sep 2022 13:43:45 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Sachin Sant <sachinp@linux.ibm.com>
Cc:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-scsi@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: [powerpc] memcpy warning drivers/scsi/scsi_transport_fc.c:581
 (next-20220921)
Message-ID: <202209211250.3049C29@keescook>
References: <42404B5E-198B-4FD3-94D6-5E16CF579EF3@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42404B5E-198B-4FD3-94D6-5E16CF579EF3@linux.ibm.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, Sep 21, 2022 at 09:21:52PM +0530, Sachin Sant wrote:
> While booting recent linux-next kernel on a Power server following
> warning is seen:
> 
> [    6.427054] lpfc 0022:01:00.0: 0:6468 Set host date / time: Status x10:
> [    6.471457] lpfc 0022:01:00.0: 0:6448 Dual Dump is enabled
> [    7.432161] ------------[ cut here ]------------
> [    7.432178] memcpy: detected field-spanning write (size 8) of single field "&event->event_data" at drivers/scsi/scsi_transport_fc.c:581 (size 4)

Interesting!

The memcpy() is this one:

                memcpy(&event->event_data, data_buf, data_len);

The struct member, "event_data" is defined as u32:

...
 * Note: if Vendor Unique message, &event_data will be  start of
 * Note: if Vendor Unique message, event_data_flex will be start of
 *      vendor unique payload, and the length of the payload is
 *       per event_datalen
...
struct fc_nl_event {
        struct scsi_nl_hdr snlh;                /* must be 1st element !  */
        __u64 seconds;
        __u64 vendor_id;
        __u16 host_no;
        __u16 event_datalen;
        __u32 event_num;
        __u32 event_code;
        __u32 event_data;
} __attribute__((aligned(sizeof(__u64))));

The warning says memcpy is trying to write 8 bytes into the 4 byte
member, so the compiler is seeing it "correctly", but I think this is
partially a false positive. It looks like there is also a small bug in
the allocation size calculation and therefore a small leak of kernel
heap memory contents. My notes:

void
fc_host_post_fc_event(struct Scsi_Host *shost, u32 event_number,
                enum fc_host_event_code event_code,
                u32 data_len, char *data_buf, u64 vendor_id)
{
	...
        struct fc_nl_event *event;
	...
        if (!data_buf || data_len < 4)
                data_len = 0;

This wants a data_buf and a data_len >= 4, so it does look like it's
expected to be variable sized. There does appear to be an alignment
and padding expectation, though:

/* macro to round up message lengths to 8byte boundary */
#define FC_NL_MSGALIGN(len)             (((len) + 7) & ~7)

	...
        len = FC_NL_MSGALIGN(sizeof(*event) + data_len);

But this is immediately suspicious: sizeof(*event) _includes_ event_data,
so the alignment is going to be bumped up incorrectly. Note that
struct fc_nl_event is 8 * 5 == 40 bytes, which allows for 4 bytes in
event_data. But setting data_len to 4 (i.e. no "overflow") means we're
asking for 44 bytes, which is aligned to 48.

So, in all cases, there is uninitialized memory being sent...

        skb = nlmsg_new(len, GFP_KERNEL);
	...
        nlh = nlmsg_put(skb, 0, 0, SCSI_TRANSPORT_MSG, len, 0);
	...
        event = nlmsg_data(nlh);
	...
        event->event_datalen = data_len;        /* bytes */

Comments in the struct say this is counting from start of event_data.

	...
        if (data_len)
                memcpy(&event->event_data, data_buf, data_len);

And here is the reported memcpy().

The callers of fc_host_post_fc_event() are:

        fc_host_post_fc_event(shost, event_number, event_code,
                (u32)sizeof(u32), (char *)&event_data, 0);

Fixed-size of 4 bytes: no "overflow".

        fc_host_post_fc_event(shost, event_number, FCH_EVT_VENDOR_UNIQUE,
                data_len, data_buf, vendor_id);

        fc_host_post_fc_event(shost, fc_get_event_number(),
                                FCH_EVT_LINK_FPIN, fpin_len, fpin_buf, 0);

These two appear to be of arbitrary length, but I didn't look more
deeply.

Given that the only user of struct fc_nl_event is fc_host_post_fc_event()
in drivers/scsi/scsi_transport_fc.c, it looks safe to say that changing
the struct to use a flexible array is the thing to do in the kernel, but
we can't actually change the size or layout because it's a UAPI header.

Are you able to test this patch:

diff --git a/drivers/scsi/scsi_transport_fc.c b/drivers/scsi/scsi_transport_fc.c
index a2524106206d..0d798f11dc34 100644
--- a/drivers/scsi/scsi_transport_fc.c
+++ b/drivers/scsi/scsi_transport_fc.c
@@ -543,7 +543,7 @@ fc_host_post_fc_event(struct Scsi_Host *shost, u32 event_number,
 	struct nlmsghdr	*nlh;
 	struct fc_nl_event *event;
 	const char *name;
-	u32 len;
+	size_t len, padding;
 	int err;
 
 	if (!data_buf || data_len < 4)
@@ -554,7 +554,7 @@ fc_host_post_fc_event(struct Scsi_Host *shost, u32 event_number,
 		goto send_fail;
 	}
 
-	len = FC_NL_MSGALIGN(sizeof(*event) + data_len);
+	len = FC_NL_MSGALIGN(sizeof(*event) - sizeof(event->event_data) + data_len);
 
 	skb = nlmsg_new(len, GFP_KERNEL);
 	if (!skb) {
@@ -578,7 +578,9 @@ fc_host_post_fc_event(struct Scsi_Host *shost, u32 event_number,
 	event->event_num = event_number;
 	event->event_code = event_code;
 	if (data_len)
-		memcpy(&event->event_data, data_buf, data_len);
+		memcpy(event->event_data_flex, data_buf, data_len);
+	padding = len - offsetof(typeof(*event), event_data_flex) - data_len;
+	memset(event->event_data_flex + data_len, 0, padding);
 
 	nlmsg_multicast(scsi_nl_sock, skb, 0, SCSI_NL_GRP_FC_EVENTS,
 			GFP_KERNEL);
diff --git a/include/uapi/scsi/scsi_netlink_fc.h b/include/uapi/scsi/scsi_netlink_fc.h
index 7535253f1a96..b46e9cbeb001 100644
--- a/include/uapi/scsi/scsi_netlink_fc.h
+++ b/include/uapi/scsi/scsi_netlink_fc.h
@@ -35,7 +35,7 @@
  * FC Transport Broadcast Event Message :
  *   FC_NL_ASYNC_EVENT
  *
- * Note: if Vendor Unique message, &event_data will be  start of
+ * Note: if Vendor Unique message, event_data_flex will be start of
  * 	 vendor unique payload, and the length of the payload is
  *       per event_datalen
  *
@@ -50,7 +50,10 @@ struct fc_nl_event {
 	__u16 event_datalen;
 	__u32 event_num;
 	__u32 event_code;
-	__u32 event_data;
+	union {
+		__u32 event_data;
+		__DECLARE_FLEX_ARRAY(__u8, event_data_flex);
+	};
 } __attribute__((aligned(sizeof(__u64))));
 
 



-- 
Kees Cook
