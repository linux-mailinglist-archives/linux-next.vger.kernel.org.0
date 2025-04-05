Return-Path: <linux-next+bounces-6162-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEB7A7CB05
	for <lists+linux-next@lfdr.de>; Sat,  5 Apr 2025 19:34:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 306D518932CF
	for <lists+linux-next@lfdr.de>; Sat,  5 Apr 2025 17:34:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46E4199931;
	Sat,  5 Apr 2025 17:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="lrsHelYW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E8E1BC2A
	for <linux-next@vger.kernel.org>; Sat,  5 Apr 2025 17:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743874478; cv=none; b=CGeqoo+yTeLKSDZ3GRrx36ohakDEBeq/li8Jdz4/sWYh396ZOBhmfAF7H5o02DND4epul9vTCxYlsTMWhpEHtmZZtegD3n8cucxTUVatdWhU3WPhSXMkKJCCJqk/nbjWAlO5N1pEkhz89L4EkoBaVcj9n2KcAFmHJifUEL9RVvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743874478; c=relaxed/simple;
	bh=zNbMsd5ZMKQEgcUqH2G9jdZjS7mVpjxPElH2t8AaYBk=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID; b=RfM36lC5wlfG7Ekx5nrgWP260b0MQj+qscyi0T9FtrGZCnMdfNIE84E/0HbJYwlEm8kdbrfg4YnyBGXaEzmwLZC2hFW2W36WNNB3v0leUdzcMl/n22lsUwGtdDGw21j5BAWDQXzSVuF5ym6+qA6lvw2KbEFOtrDLoNoFlZSMTOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=lrsHelYW; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-226185948ffso31377455ad.0
        for <linux-next@vger.kernel.org>; Sat, 05 Apr 2025 10:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1743874475; x=1744479275; darn=vger.kernel.org;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OCQtICYkn6uP4Xo9tW2ueXrTg+tiER3HquLdyfSwfUI=;
        b=lrsHelYWL2bwtrA6DRb0QpmpWv1r5nOqAWF/3bPLr+92+DWMq0ZwhWGyzbD+yeIyQo
         TRilBAWfTrVBOPBUP/eSsMm8UsJaS2+04xqvZsF4MU/tf9Ldb+pQ/NcdX6j19d2l11dU
         jmmi6WEHR7mtbeE3bz3/0G6bYpQrNJNopoEjGqQ5x0Zkg1H3vxwbjkZ3NXD0iDt6ny+t
         l7zamgX2qfMnvPSXHspDdKH2z0xtTJ+sa3Z89tquiHluZYxP4tICUd1RyspX3bq19MpL
         PFNRShtRBzn9WJ4ms0fV9U6UbM+e0Sx7jaGK/PlSXp5DEyMJFJNOKUos/OSi+1tTJwP2
         YN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743874475; x=1744479275;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OCQtICYkn6uP4Xo9tW2ueXrTg+tiER3HquLdyfSwfUI=;
        b=vdrGXIGz+OG21QzkKvm/5o10icjSwrwI0cHQ1Z2n4Q5PxxsWOQWbnDdgpSTFMjttbw
         NJXpA0oHBos3Ra4GpXS2xErRI3eUBuRbNUlAiYnkjVgdh6/9bRYftHmiyC4L3cI9oNV6
         FXavkUQYdTIky3Crd+b8TpkDvZQdR9a0MP7hBhDjN3VakwbdTm25uTZjQJN4S0mffUZ8
         Tew5K5ohISdZITFbBlW4pY+MB49+4/f105L4HwRtxZcQ0oQtsSFpTCVoj0XhW1KNeVht
         bRzIKvcGN0CDtx7pQFxDMI/dRJs21VnGMkKFIZ34tEV2fVTKuRIU82VMHJRrBCdeqZDn
         F6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVvzOlNi40+d0wlBYzO8J6UTd1jI00qcgZKMwUDB7VMCV4DxiOF8neDkT1g5WwqNUStlhDc1IDFqTp0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd4xwwEWiDoEcD3eEBKaDpkdCjQbp/PqV8D/sh7efxywwr57vS
	7lNAf66/lJcuCxgSH/vzz/njgYSW/322SdCcNiS8vefM0CjbKjWSqfJaXJ7McvE=
X-Gm-Gg: ASbGncsTeZNxKN6q/7YhQ+3hl5s0vwlqz7mIdvbqxFl1jAOoZY6vygyHMvQNzk4K4Sk
	sVHeywhs9gEGMkNh00dJS3Yw42WWcPILFfbqMi6Ihkdr9CcWvG4b/2fjlVfDINLNKnnZwoCuFRJ
	pgGI08aPlVmus+l5nDoZoFH6n/fHwDehOYqoXnOy/zIlmNtP8mUO4lEDzMlmbFkbmQA42vFeFXm
	0nkJ0lYSstE1vviGz5wSeHP6g0nybAiGHBFQ+LmgInAK9IKpEPTjTsKYG45qItNjS8rxPL2uN8h
	/eYv4kPCUzpOcNq02XgMyXUFbGU5ET7PvzVwPNR7MQ==
X-Google-Smtp-Source: AGHT+IF80lvJLAgMXgSxNXCpMXC/gbO5XZ3y9Dd2bI9pYYdOBComYrwaxqbJakPqUqjZ8rd4ZAFXkg==
X-Received: by 2002:a17:902:cf4b:b0:224:1220:7f40 with SMTP id d9443c01a7336-22a9551417fmr46708245ad.3.1743874475182;
        Sat, 05 Apr 2025 10:34:35 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785bff96sm52456355ad.59.2025.04.05.10.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 10:34:34 -0700 (PDT)
Date: Sat, 05 Apr 2025 10:34:34 -0700 (PDT)
X-Google-Original-Date: Sat, 05 Apr 2025 10:34:32 PDT (-0700)
Subject:     Re: [BUG -next] ./usr/include/cxl/features.h:11:10: fatal error: uuid/uuid.h: No such file or directory
In-Reply-To: <67e7301dc8ad7_201f0294a5@dwillia2-xfh.jf.intel.com.notmuch>
CC: paulmck@kernel.org, dave.jiang@intel.com, linux-cxl@vger.kernel.org,
  dave@stgolabs.net, jonathan.cameron@huawei.com, alison.schofield@intel.com,
  vishal.l.verma@intel.com, ira.weiny@intel.com, dan.j.williams@intel.com, gourry@gourry.net,
  linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dan.j.williams@intel.com
Message-ID: <mhng-2b1b4293-576d-4ba1-a4c6-1109a50ce058@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>

On Fri, 28 Mar 2025 16:26:21 PDT (-0700), dan.j.williams@intel.com wrote:
> Paul E. McKenney wrote:
> [..]
>> > > Making the above change got me this:
>> > >
>> > > usr/include/cxl/features.h:59:9: error: unknown type name ‘uuid_t’
>> > I wasn't able to hit that with allmodconfig on x86 with a Fedora 41 build setup. What is the specific command lines you are using?
>>
>> make clean
>> make allmodconfig
>> make -j$N
>>
>> Though encapsulated as follows:
>>
>> tools/testing/selftests/rcutorture/bin/torture.sh --do-none --do-allmodconfig
>
> The problem is that uuid_t is not defined for uapi headers to reuse.
> Perhaps checkpatch should be checking for uuid_t in uapi headers going
> forward.
>
> For now the following builds for me, but it is a quite a mess to undo
> the assumption that that the hardware object definitions can not use
> uuid_t:
>
> -- 8< --
> diff --git a/drivers/cxl/core/features.c b/drivers/cxl/core/features.c
> index f4daefe3180e..d626dd7c5fbf 100644
> --- a/drivers/cxl/core/features.c
> +++ b/drivers/cxl/core/features.c
> @@ -33,7 +33,11 @@ static bool is_cxl_feature_exclusive_by_uuid(const uuid_t *uuid)
>
>  static bool is_cxl_feature_exclusive(struct cxl_feat_entry *entry)
>  {
> -	return is_cxl_feature_exclusive_by_uuid(&entry->uuid);
> +	uuid_t uuid;
> +
> +	import_uuid(&uuid, entry->uuid);
> +
> +	return is_cxl_feature_exclusive_by_uuid(&uuid);
>  }
>
>  inline struct cxl_features_state *to_cxlfs(struct cxl_dev_state *cxlds)
> @@ -228,7 +232,7 @@ size_t cxl_get_feature(struct cxl_mailbox *cxl_mbox, const uuid_t *feat_uuid,
>  		return 0;
>
>  	size_out = min(feat_out_size, cxl_mbox->payload_size);
> -	uuid_copy(&pi.uuid, feat_uuid);
> +	export_uuid(pi.uuid, feat_uuid);
>  	pi.selection = selection;
>  	do {
>  		data_to_rd_size = min(feat_out_size - data_rcvd_size,
> @@ -282,7 +286,7 @@ int cxl_set_feature(struct cxl_mailbox *cxl_mbox,
>  	if (!pi)
>  		return -ENOMEM;
>
> -	uuid_copy(&pi->uuid, feat_uuid);
> +	export_uuid(pi->uuid, feat_uuid);
>  	pi->version = feat_version;
>  	feat_flag &= ~CXL_SET_FEAT_FLAG_DATA_TRANSFER_MASK;
>  	feat_flag |= CXL_SET_FEAT_FLAG_DATA_SAVED_ACROSS_RESET;
> @@ -360,16 +364,19 @@ get_support_feature_info(struct cxl_features_state *cxlfs,
>  			 const struct fwctl_rpc_cxl *rpc_in)
>  {
>  	struct cxl_feat_entry *feat;
> -	const uuid_t *uuid;
> +	uuid_t in_uuid;
>
> -	if (rpc_in->op_size < sizeof(uuid))
> +	if (rpc_in->op_size < sizeof(in_uuid))
>  		return ERR_PTR(-EINVAL);
>
> -	uuid = &rpc_in->set_feat_in.uuid;
> +	import_uuid(&in_uuid, rpc_in->set_feat_in.uuid);
>
>  	for (int i = 0; i < cxlfs->entries->num_features; i++) {
> +		uuid_t feat_uuid;
> +
>  		feat = &cxlfs->entries->ent[i];
> -		if (uuid_equal(uuid, &feat->uuid))
> +		import_uuid(&feat_uuid, feat->uuid);
> +		if (uuid_equal(&in_uuid, &feat_uuid))
>  			return feat;
>  	}
>
> @@ -461,6 +468,7 @@ static void *cxlctl_get_feature(struct cxl_features_state *cxlfs,
>  	const struct cxl_mbox_get_feat_in *feat_in;
>  	u16 offset, count, return_code;
>  	size_t out_size = *out_len;
> +	uuid_t uuid;
>
>  	if (rpc_in->op_size != sizeof(*feat_in))
>  		return ERR_PTR(-EINVAL);
> @@ -477,9 +485,10 @@ static void *cxlctl_get_feature(struct cxl_features_state *cxlfs,
>  	if (!rpc_out)
>  		return ERR_PTR(-ENOMEM);
>
> -	out_size = cxl_get_feature(cxl_mbox, &feat_in->uuid,
> -				   feat_in->selection, rpc_out->payload,
> -				   count, offset, &return_code);
> +	import_uuid(&uuid, feat_in->uuid);
> +	out_size = cxl_get_feature(cxl_mbox, &uuid, feat_in->selection,
> +				   rpc_out->payload, count, offset,
> +				   &return_code);
>  	*out_len = sizeof(struct fwctl_rpc_cxl_out);
>  	if (!out_size) {
>  		rpc_out->size = 0;
> @@ -502,6 +511,7 @@ static void *cxlctl_set_feature(struct cxl_features_state *cxlfs,
>  	const struct cxl_mbox_set_feat_in *feat_in;
>  	size_t out_size, data_size;
>  	u16 offset, return_code;
> +	uuid_t uuid;
>  	u32 flags;
>  	int rc;
>
> @@ -510,7 +520,8 @@ static void *cxlctl_set_feature(struct cxl_features_state *cxlfs,
>
>  	feat_in = &rpc_in->set_feat_in;
>
> -	if (is_cxl_feature_exclusive_by_uuid(&feat_in->uuid))
> +	import_uuid(&uuid, feat_in->uuid);
> +	if (is_cxl_feature_exclusive_by_uuid(&uuid))
>  		return ERR_PTR(-EPERM);
>
>  	offset = le16_to_cpu(feat_in->offset);
> @@ -525,9 +536,9 @@ static void *cxlctl_set_feature(struct cxl_features_state *cxlfs,
>  	rpc_out->size = 0;
>
>  	data_size = rpc_in->op_size - sizeof(feat_in->hdr);
> -	rc = cxl_set_feature(cxl_mbox, &feat_in->uuid,
> -			     feat_in->version, feat_in->feat_data,
> -			     data_size, flags, offset, &return_code);
> +	rc = cxl_set_feature(cxl_mbox, &uuid, feat_in->version,
> +			     feat_in->feat_data, data_size, flags, offset,
> +			     &return_code);
>  	if (rc) {
>  		rpc_out->retval = return_code;
>  		return no_free_ptr(rpc_out);
> diff --git a/include/uapi/cxl/features.h b/include/uapi/cxl/features.h
> index d6db8984889f..1e3323854994 100644
> --- a/include/uapi/cxl/features.h
> +++ b/include/uapi/cxl/features.h
> @@ -8,11 +8,6 @@
>  #define _UAPI_CXL_FEATURES_H_
>
>  #include <linux/types.h>
> -#ifndef __KERNEL__
> -#include <uuid/uuid.h>
> -#else
> -#include <linux/uuid.h>
> -#endif
>
>  /*
>   * struct cxl_mbox_get_sup_feats_in - Get Supported Features input
> @@ -60,7 +55,7 @@ struct cxl_mbox_get_sup_feats_in {
>   * Get Supported Features Supported Feature Entry
>   */
>  struct cxl_feat_entry {
> -	uuid_t uuid;
> +	__u8 uuid[16];
>  	__le16 id;
>  	__le16 get_feat_size;
>  	__le16 set_feat_size;
> @@ -110,7 +105,7 @@ struct cxl_mbox_get_sup_feats_out {
>   * CXL spec r3.2 section 8.2.9.6.2 Table 8-99
>   */
>  struct cxl_mbox_get_feat_in {
> -	uuid_t uuid;
> +	__u8 uuid[16];
>  	__le16 offset;
>  	__le16 count;
>  	__u8 selection;
> @@ -143,7 +138,7 @@ enum cxl_get_feat_selection {
>   */
>  struct cxl_mbox_set_feat_in {
>  	__struct_group(cxl_mbox_set_feat_hdr, hdr, /* no attrs */,
> -		uuid_t uuid;
> +		__u8 uuid[16];
>  		__le32 flags;
>  		__le16 offset;
>  		__u8 version;
> diff --git a/tools/testing/cxl/test/mem.c b/tools/testing/cxl/test/mem.c
> index f2957a3e36fe..d0276ab3a92f 100644
> --- a/tools/testing/cxl/test/mem.c
> +++ b/tools/testing/cxl/test/mem.c
> @@ -1397,7 +1397,7 @@ static int mock_activate_fw(struct cxl_mockmem_data *mdata,
>
>  static void fill_feature_vendor_test(struct cxl_feat_entry *feat)
>  {
> -	feat->uuid = CXL_VENDOR_FEATURE_TEST;
> +	export_uuid(feat->uuid, &CXL_VENDOR_FEATURE_TEST);
>  	feat->id = 0;
>  	feat->get_feat_size = cpu_to_le16(0x4);
>  	feat->set_feat_size = cpu_to_le16(0x4);
> @@ -1441,8 +1441,10 @@ static int mock_get_feature(struct cxl_mockmem_data *mdata,
>  			    struct cxl_mbox_cmd *cmd)
>  {
>  	struct cxl_mbox_get_feat_in *input = cmd->payload_in;
> +	uuid_t in_uuid;
>
> -	if (uuid_equal(&input->uuid, &CXL_VENDOR_FEATURE_TEST))
> +	import_uuid(&in_uuid, input->uuid);
> +	if (uuid_equal(&in_uuid, &CXL_VENDOR_FEATURE_TEST))
>  		return mock_get_test_feature(mdata, cmd);
>
>  	cmd->return_code = CXL_MBOX_CMD_RC_UNSUPPORTED;
> @@ -1485,8 +1487,10 @@ static int mock_set_feature(struct cxl_mockmem_data *mdata,
>  			    struct cxl_mbox_cmd *cmd)
>  {
>  	struct cxl_mbox_set_feat_in *input = cmd->payload_in;
> +	uuid_t in_uuid;
>
> -	if (uuid_equal(&input->hdr.uuid, &CXL_VENDOR_FEATURE_TEST))
> +	import_uuid(&in_uuid, input->hdr.uuid);
> +	if (uuid_equal(&in_uuid, &CXL_VENDOR_FEATURE_TEST))
>  		return mock_set_test_feature(mdata, cmd);
>
>  	cmd->return_code = CXL_MBOX_CMD_RC_UNSUPPORTED;

I hit this too, also in allmodconfig (and in my case for a cross build, 
so I have very few system headers).  This seems to fix it, so

Tested-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

